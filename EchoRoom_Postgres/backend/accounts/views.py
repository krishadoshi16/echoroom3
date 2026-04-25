from __future__ import annotations

from rest_framework import status
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_simplejwt.tokens import RefreshToken

from debates.models import DebateTopic, Opinion
from .serializers import (
    ChangePasswordSerializer,
    RegisterSerializer,
    UpdateProfileSerializer,
    UserPublicSerializer,
)


class RegisterView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = RegisterSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()

        # Issue JWT tokens right after successful registration.
        refresh = RefreshToken.for_user(user)
        return Response(
            {
                "access": str(refresh.access_token),
                "refresh": str(refresh),
                "user": UserPublicSerializer(user).data,
            },
            status=status.HTTP_201_CREATED,
        )


class MeView(APIView):
    def get(self, request):
        return Response(UserPublicSerializer(request.user).data, status=status.HTTP_200_OK)

    def patch(self, request):
        serializer = UpdateProfileSerializer(data=request.data, context={"request": request})
        serializer.is_valid(raise_exception=True)
        user = request.user
        updated_fields = []
        if "username" in serializer.validated_data:
            user.username = serializer.validated_data["username"]
            updated_fields.append("username")
        if "email" in serializer.validated_data:
            user.email = serializer.validated_data["email"]
            updated_fields.append("email")
        if updated_fields:
            user.save(update_fields=updated_fields)
        return Response(UserPublicSerializer(user).data, status=status.HTTP_200_OK)


class ChangePasswordView(APIView):
    def post(self, request):
        serializer = ChangePasswordSerializer(data=request.data, context={"request": request})
        serializer.is_valid(raise_exception=True)
        request.user.set_password(serializer.validated_data["new_password"])
        request.user.save(update_fields=["password"])
        return Response({"detail": "Password updated successfully."}, status=status.HTTP_200_OK)


class MeActivityView(APIView):
    def get(self, request):
        user = request.user
        topics = (
            DebateTopic.objects.filter(created_by=user)
            .select_related("category")
            .order_by("-created_at")[:5]
        )
        opinions = (
            Opinion.objects.filter(author=user)
            .select_related("debate")
            .order_by("-created_at")[:5]
        )
        return Response(
            {
                "stats": {
                    "topics": DebateTopic.objects.filter(created_by=user).count(),
                    "opinions": Opinion.objects.filter(author=user).count(),
                },
                "recentTopics": [
                    {
                        "id": t.id,
                        "title": t.title,
                        "category": t.category.name,
                        "status": t.status,
                    }
                    for t in topics
                ],
                "recentOpinions": [
                    {
                        "id": o.id,
                        "debate": o.debate.title,
                        "stance": "FOR" if o.stance == Opinion.Stance.FOR else "AGAINST",
                        "content": o.content[:120],
                    }
                    for o in opinions
                ],
            },
            status=status.HTTP_200_OK,
        )


class GoogleLoginView(APIView):
    """
    Custom Google login that verifies tokens directly with Google's tokeninfo API.
    This completely bypasses allauth and its SocialApp database lookups,
    eliminating the MultipleObjectsReturned error permanently.
    """
    permission_classes = [AllowAny]

    def post(self, request):
        import os
        import requests as http_requests
        from django.contrib.auth import get_user_model

        # Frontend sends the Google JWT credential as both access_token and id_token
        id_token = (
            request.data.get("id_token")
            or request.data.get("credential")
            or request.data.get("access_token")
        )

        if not id_token:
            return Response(
                {"detail": "id_token is required"},
                status=status.HTTP_400_BAD_REQUEST,
            )

        # Verify with Google
        try:
            google_response = http_requests.get(
                "https://oauth2.googleapis.com/tokeninfo",
                params={"id_token": id_token},
                timeout=10,
            )
        except Exception as e:
            return Response(
                {"detail": f"Failed to contact Google: {e}"},
                status=status.HTTP_503_SERVICE_UNAVAILABLE,
            )

        if google_response.status_code != 200:
            return Response(
                {"detail": "Invalid Google token"},
                status=status.HTTP_400_BAD_REQUEST,
            )

        google_data = google_response.json()

        # Verify token audience matches our app's client ID
        expected_client_id = os.environ.get("GOOGLE_CLIENT_ID", "")
        token_aud = google_data.get("aud", "")
        if expected_client_id and token_aud != expected_client_id:
            return Response(
                {"detail": "Token audience mismatch"},
                status=status.HTTP_400_BAD_REQUEST,
            )

        email = google_data.get("email")
        if not email:
            return Response(
                {"detail": "Email not found in Google token"},
                status=status.HTTP_400_BAD_REQUEST,
            )

        if not google_data.get("email_verified"):
            return Response(
                {"detail": "Google email not verified"},
                status=status.HTTP_400_BAD_REQUEST,
            )

        User = get_user_model()

        # Build a safe username from email prefix
        base_username = email.split("@")[0]
        username = base_username
        counter = 1
        while User.objects.filter(username=username).exclude(email=email).exists():
            username = f"{base_username}{counter}"
            counter += 1

        # Get or create user
        user, created = User.objects.get_or_create(
            email=email,
            defaults={
                "username": username,
                "first_name": google_data.get("given_name", ""),
                "last_name": google_data.get("family_name", ""),
            },
        )

        if created:
            user.set_unusable_password()
            user.save()

        # Issue JWT tokens
        refresh = RefreshToken.for_user(user)
        return Response(
            {
                "access": str(refresh.access_token),
                "refresh": str(refresh),
                "user": {
                    "id": user.id,
                    "username": user.username,
                    "email": user.email,
                },
            },
            status=status.HTTP_200_OK,
        )

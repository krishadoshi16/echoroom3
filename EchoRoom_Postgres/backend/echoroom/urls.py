"""
URL configuration for echoroom project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/6.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import include, path
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from allauth.socialaccount.providers.google.views import GoogleOAuth2Adapter
from allauth.socialaccount.providers.oauth2.client import OAuth2Client
from dj_rest_auth.registration.views import SocialLoginView

from django.http import JsonResponse
import traceback

class GoogleLogin(SocialLoginView):
    adapter_class = GoogleOAuth2Adapter
    callback_url = "https://echoroom-frontend-v3.onrender.com"
    client_class = OAuth2Client

    def dispatch(self, request, *args, **kwargs):
        try:
            return super().dispatch(request, *args, **kwargs)
        except Exception as e:
            tb = traceback.format_exc()
            print("GOOGLE LOGIN ERROR:", tb)
            return JsonResponse({"detail": str(e), "traceback": tb}, status=400)

urlpatterns = [
    path("admin/", admin.site.urls),
    # JWT auth endpoints (access + refresh)
    path("api/token/", TokenObtainPairView.as_view(), name="token_obtain_pair"),
    path(
        "api/token/refresh/",
        TokenRefreshView.as_view(),
        name="token_refresh",
    ),
    # App endpoints
    path("api/auth/", include("accounts.urls")),
    path("api/debates/", include("debates.urls")),
    path("api/admin/", include("admin_api.urls")),
    # Social Auth
    path("api/social/google/", GoogleLogin.as_view(), name="google_login"),
]

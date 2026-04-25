"""
URL configuration for echoroom project.
"""
from django.contrib import admin
from django.urls import include, path
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from accounts.views import GoogleLoginView

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
    # Social Auth - custom view that bypasses allauth entirely
    path("api/social/google/", GoogleLoginView.as_view(), name="google_login"),
]

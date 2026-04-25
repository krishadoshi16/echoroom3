"""
Custom allauth social account adapter.

This adapter bypasses the database entirely for the Google SocialApp lookup.
Instead, it creates an in-memory SocialApp object using environment variables.
This prevents the MultipleObjectsReturned error caused by having both
a settings-based APP config and a database entry.
"""
import os

from allauth.socialaccount.adapter import DefaultSocialAccountAdapter


class CustomSocialAccountAdapter(DefaultSocialAccountAdapter):
    """
    Override get_app to read Google credentials from environment variables
    instead of querying the database. This eliminates any possibility of
    MultipleObjectsReturned errors.
    """

    def get_app(self, request, provider, client_id=None):
        if provider == "google":
            from allauth.socialaccount.models import SocialApp

            app = SocialApp()
            app.provider = "google"
            app.client_id = os.environ.get("GOOGLE_CLIENT_ID", "")
            app.secret = os.environ.get("GOOGLE_CLIENT_SECRET", "")
            app.key = ""
            app.pk = None  # Not persisted — in-memory only
            return app

        # Fall back to default DB lookup for any other provider
        return super().get_app(request, provider, client_id=client_id)

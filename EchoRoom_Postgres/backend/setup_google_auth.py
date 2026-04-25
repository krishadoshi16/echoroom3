import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'echoroom.settings')
django.setup()

from django.contrib.sites.models import Site
from allauth.socialaccount.models import SocialApp

def setup():
    # 1. Update Site
    site, created = Site.objects.get_or_create(id=1)
    site.domain = 'echoroom-frontend-v3.onrender.com'
    site.name = 'EchoRoom'
    site.save()
    print(f"Site configured: {site.domain}")

    # 2. Create Social App
    # Get credentials from environment variables (set these in Render/Local)
    client_id = os.getenv('GOOGLE_CLIENT_ID')
    secret = os.getenv('GOOGLE_CLIENT_SECRET')
    
    if not client_id or not secret:
        print("Error: GOOGLE_CLIENT_ID or GOOGLE_CLIENT_SECRET not set in environment.")
        return

    # Delete existing to prevent MultipleObjectsReturned
    SocialApp.objects.filter(provider='google').delete()

    app = SocialApp.objects.create(
        provider='google',
        name='Google',
        client_id=client_id,
        secret=secret
    )
    app.sites.add(site)
    print(f"Social App 'Google' configured.")

if __name__ == '__main__':
    setup()

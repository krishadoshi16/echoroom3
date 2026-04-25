from django.core.management.base import BaseCommand
import os


class Command(BaseCommand):
    help = 'Clean up duplicate Google SocialApp entries and ensure correct one exists'

    def handle(self, *args, **options):
        from allauth.socialaccount.models import SocialApp
        from django.contrib.sites.models import Site

        client_id = os.environ.get('GOOGLE_CLIENT_ID', '')
        secret = os.environ.get('GOOGLE_CLIENT_SECRET', '')

        if not client_id or not secret:
            self.stderr.write('GOOGLE_CLIENT_ID or GOOGLE_CLIENT_SECRET not set. Skipping.')
            return

        # Delete ALL existing google social apps
        deleted_count, _ = SocialApp.objects.filter(provider='google').delete()
        self.stdout.write(f'Deleted {deleted_count} existing Google SocialApp(s).')

        # Create fresh one
        app = SocialApp.objects.create(
            provider='google',
            name='Google',
            client_id=client_id,
            secret=secret,
        )

        # Link to site 1
        site, created = Site.objects.get_or_create(id=1, defaults={
            'domain': 'echoroom-frontend-v3.onrender.com',
            'name': 'EchoRoom'
        })
        if not created:
            site.domain = 'echoroom-frontend-v3.onrender.com'
            site.name = 'EchoRoom'
            site.save()

        app.sites.add(site)

        self.stdout.write(self.style.SUCCESS(
            f'Google SocialApp created (id={app.id}, client_id={client_id[:20]}...)'
        ))

# Generated by Django 3.2.7 on 2021-10-04 18:32

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('account', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Club_House',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=150)),
                ('created_on', models.DateField(auto_now=True)),
                ('cover_photo', models.ImageField(blank=True, upload_to='clubhouse_photo')),
                ('description', models.TextField()),
                ('active', models.BooleanField(default=True)),
                ('verified', models.BooleanField(default=False)),
                ('admin', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Event_Registration',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.CharField(choices=[('R', 'Requested'), ('A', 'Accepted'), ('D', 'Declined')], max_length=1)),
                ('registered_on', models.DateTimeField(auto_now=True)),
                ('event', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='clubhouse.club_house')),
                ('registered_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Event',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=150)),
                ('description', models.TextField()),
                ('event_date', models.DateField()),
                ('venue', models.TextField()),
                ('highlight', models.TextField()),
                ('registration_close_date', models.DateField()),
                ('poster_image', models.ImageField(upload_to='event_poster')),
                ('created_on', models.DateTimeField(auto_now=True)),
                ('club_house', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='clubhouse.club_house')),
                ('location', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='account.location')),
            ],
        ),
        migrations.CreateModel(
            name='Club_House_Member',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.CharField(choices=[('R', 'Requested'), ('A', 'Accepted'), ('D', 'Declined')], max_length=1)),
                ('join_date', models.DateField(auto_now=True)),
                ('club_house', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('member', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='member', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]

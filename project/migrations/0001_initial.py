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
            name='Call',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(blank=True, max_length=255)),
                ('other_genre', models.CharField(blank=True, max_length=50, null=True)),
                ('other_language', models.CharField(blank=True, max_length=100, null=True)),
                ('description', models.TextField(blank=True, null=True)),
                ('budget', models.FloatField(blank=True, null=True)),
                ('expiry_date', models.DateField(null=True)),
                ('call_for', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='account.open_to')),
                ('format', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='account.format', verbose_name='Content Format')),
                ('genre', models.ManyToManyField(to='account.Genre')),
                ('language', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='account.language')),
                ('owner', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Interest',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.CreateModel(
            name='Pitch',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('story_title', models.CharField(max_length=255)),
                ('story_file', models.FileField(blank=True, null=True, upload_to='stories')),
                ('other_genre', models.CharField(blank=True, max_length=50, null=True)),
                ('other_language', models.CharField(blank=True, max_length=100, null=True)),
                ('description', models.TextField(blank=True, null=True)),
                ('budget', models.FloatField(blank=True, null=True)),
                ('format', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='account.format', verbose_name='Content Format')),
                ('genre', models.ManyToManyField(to='account.Genre')),
                ('language', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='account.language')),
                ('owner', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('pitch_to_people', models.ManyToManyField(blank=True, null=True, related_name='to_user', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('post_title', models.CharField(blank=True, max_length=255)),
                ('post_category', models.CharField(choices=[('P', 'Project'), ('A', 'Award'), ('S', 'As Assistant'), ('C', 'Calls'), ('T', 'Pitch')], max_length=1)),
                ('date', models.DateTimeField(auto_now=True)),
                ('active', models.BooleanField(default=True)),
                ('assistant', models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='account.assistant')),
                ('award', models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='account.award')),
                ('call', models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='project.call')),
                ('pitch', models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='project.pitch')),
                ('project', models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='account.project')),
            ],
        ),
        migrations.CreateModel(
            name='Upvote',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('post', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='project.post')),
                ('upvoted_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Report',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('comment', models.TextField()),
                ('date', models.DateField(auto_now=True)),
                ('post', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='project.post')),
                ('reported_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Message',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField(auto_now=True)),
                ('message', models.TextField()),
                ('unread', models.BooleanField(default=True)),
                ('m_file', models.FileField(blank=True, null=True, upload_to='message_file')),
                ('interest', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='project.interest')),
                ('message_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('message_to', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='message_to', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Like',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('liked_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('post', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='project.post')),
            ],
        ),
        migrations.AddField(
            model_name='interest',
            name='post',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='project.post'),
        ),
        migrations.AddField(
            model_name='interest',
            name='shown_by',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.CreateModel(
            name='Downvote',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('downvoted_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('post', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='project.post')),
            ],
        ),
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('comment', models.TextField()),
                ('date', models.DateField(auto_now=True)),
                ('commented_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('post', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='project.post')),
            ],
        ),
    ]

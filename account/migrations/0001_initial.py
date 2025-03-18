# Generated by Django 3.2.7 on 2021-10-04 18:32

import account.managers
import account.models
from django.conf import settings
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('username', models.CharField(max_length=30, unique=True)),
                ('email', models.EmailField(max_length=254, unique=True, verbose_name='email address')),
                ('first_name', models.CharField(blank=True, max_length=30, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=30, verbose_name='last name')),
                ('gender', models.CharField(blank=True, choices=[('', 'Choose Gender'), ('M', 'Male'), ('F', 'Female')], max_length=1)),
                ('dob', models.DateField(blank=True, null=True)),
                ('no_of_filims_worked', models.PositiveIntegerField(default=0)),
                ('mobile_no', models.CharField(blank=True, max_length=10, null=True)),
                ('profile_photo', models.ImageField(blank=True, null=True, upload_to='profile_picture')),
                ('available', models.CharField(blank=True, choices=[('', 'Choose Availability'), ('F', 'Full Time'), ('P', 'Part Time')], max_length=1, null=True)),
                ('address', models.TextField(blank=True, null=True)),
                ('registered_on', models.DateField(auto_now_add=True)),
                ('is_active', models.BooleanField(default=True, verbose_name='active')),
                ('is_staff', models.BooleanField(default=False)),
                ('make_mobile_no_visible', models.CharField(blank=True, choices=[('', 'Choose Visibility'), ('E', 'Visible to Everyone'), ('F', 'Visible to Followers'), ('N', 'Visible to Following'), ('C', 'Visible to Followers/Following'), ('I', 'Invisible')], max_length=1, null=True)),
                ('make_address_visible', models.CharField(blank=True, choices=[('', 'Choose Visibility'), ('E', 'Visible to Everyone'), ('F', 'Visible to Followers'), ('N', 'Visible to Following'), ('C', 'Visible to Followers/Following'), ('I', 'Invisible')], max_length=1, null=True)),
                ('groups', models.ManyToManyField(to='auth.Group')),
            ],
            options={
                'verbose_name': 'user',
                'verbose_name_plural': 'users',
            },
            managers=[
                ('objects', account.managers.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='Format',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=70)),
            ],
        ),
        migrations.CreateModel(
            name='Genre',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Language',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('language', models.CharField(max_length=70)),
            ],
        ),
        migrations.CreateModel(
            name='Location',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Open_To',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=70)),
            ],
        ),
        migrations.CreateModel(
            name='Project',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=300)),
                ('year', models.PositiveIntegerField(validators=[account.models.my_year_validator])),
                ('budget', models.FloatField()),
                ('imdb_link', models.URLField(blank=True)),
                ('image', models.FileField(null=True, upload_to='project_image')),
                ('description', models.TextField(null=True)),
                ('status', models.CharField(blank=True, choices=[('', 'Choose Status'), ('U', 'Under production '), ('C', 'Upcoming ')], max_length=1, null=True)),
                ('created_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('genre', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='account.genre')),
                ('language', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='account.language')),
            ],
            options={
                'ordering': ('-id',),
            },
        ),
        migrations.CreateModel(
            name='UserFollowing',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('following_user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='following', to=settings.AUTH_USER_MODEL)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Testimonial',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=300)),
                ('text_content', models.TextField(blank=True)),
                ('picture_content', models.ImageField(blank=True, upload_to='testimonial_picture_content')),
                ('video_content', models.URLField(blank=True)),
                ('person', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='person', to=settings.AUTH_USER_MODEL)),
                ('project', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='account.project')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Report_People',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('reported_on', models.DateField(auto_now=True)),
                ('complaint', models.TextField(blank=True)),
                ('report_file', models.FileField(blank=True, upload_to='report file')),
                ('reported_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='reported_by', to=settings.AUTH_USER_MODEL)),
                ('reported_user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Rating',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('stars', models.IntegerField(validators=[django.core.validators.MinValueValidator(1), django.core.validators.MaxValueValidator(5)])),
                ('rated_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='rated_by', to=settings.AUTH_USER_MODEL)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Qualification',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('degree', models.CharField(max_length=100)),
                ('institute', models.CharField(max_length=250)),
                ('year', models.PositiveIntegerField(validators=[account.models.my_year_validator])),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Highlight',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('project', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='account.project')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Conversation',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField(auto_now=True)),
                ('receiver', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='receiver', to=settings.AUTH_USER_MODEL)),
                ('sender', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Company',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=150)),
                ('address', models.TextField()),
                ('mobile_no', models.CharField(max_length=10)),
                ('started_date', models.DateField()),
                ('logo', models.ImageField(upload_to='Company Logo')),
                ('location', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='account.location')),
                ('owner', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Chat',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField(auto_now=True)),
                ('message', models.TextField()),
                ('unread', models.BooleanField(default=True)),
                ('m_file', models.FileField(blank=True, null=True, upload_to='message_file')),
                ('conversation', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='account.conversation')),
                ('sender', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Blocked_User',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('blocked_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='blocked_by', to=settings.AUTH_USER_MODEL)),
                ('blocked_user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='blocked_user', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Award',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=300)),
                ('year', models.PositiveIntegerField(validators=[account.models.my_year_validator])),
                ('banner', models.CharField(max_length=100)),
                ('image', models.ImageField(upload_to='awards')),
                ('project', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='account.project')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Assistant',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('senior', models.CharField(blank=True, max_length=100)),
                ('year', models.PositiveIntegerField(blank=True, null=True, validators=[account.models.my_year_validator])),
                ('project', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='account.project')),
                ('senior_link', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='senior', to=settings.AUTH_USER_MODEL)),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AddField(
            model_name='user',
            name='interested_format',
            field=models.ManyToManyField(blank=True, to='account.Format'),
        ),
        migrations.AddField(
            model_name='user',
            name='languages_to_work',
            field=models.ManyToManyField(blank=True, to='account.Language'),
        ),
        migrations.AddField(
            model_name='user',
            name='location',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='account.location'),
        ),
        migrations.AddField(
            model_name='user',
            name='open_to',
            field=models.ManyToManyField(blank=True, to='account.Open_To'),
        ),
        migrations.AddField(
            model_name='user',
            name='specialization_of_genre',
            field=models.ManyToManyField(blank=True, to='account.Genre'),
        ),
        migrations.AddField(
            model_name='user',
            name='user_permissions',
            field=models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions'),
        ),
    ]

# Generated by Django 3.2.7 on 2022-07-08 16:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('event', '0011_alter_registration_film_duration'),
    ]

    operations = [
        migrations.AlterField(
            model_name='registration',
            name='subtitles',
            field=models.CharField(blank=True, choices=[('Y', 'Yes'), ('N', 'No')], max_length=1, null=True),
        ),
    ]

# Generated by Django 3.2.7 on 2022-07-08 16:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('event', '0009_alter_registration_sex'),
    ]

    operations = [
        migrations.AlterField(
            model_name='registration',
            name='facebook',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='registration',
            name='instagram',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='registration',
            name='reference_if_any',
            field=models.CharField(blank=True, max_length=256, null=True),
        ),
        migrations.AlterField(
            model_name='registration',
            name='twitter',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]

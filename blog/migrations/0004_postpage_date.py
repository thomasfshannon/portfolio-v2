# Generated by Django 2.1.7 on 2019-03-03 01:25

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0003_auto_20190302_2340'),
    ]

    operations = [
        migrations.AddField(
            model_name='postpage',
            name='date',
            field=models.DateTimeField(default=datetime.datetime.today, verbose_name='Post date'),
        ),
    ]
# Generated by Django 3.1.5 on 2021-01-10 21:57

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='About',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('short_description', models.TextField()),
                ('description', models.TextField()),
                ('image', models.ImageField(upload_to='about')),
            ],
            options={
                'verbose_name': 'About me',
                'verbose_name_plural': 'About me',
            },
        ),
        migrations.CreateModel(
            name='Client',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, verbose_name='Client name')),
                ('description', models.TextField(verbose_name='Client Say')),
                ('image', models.ImageField(default='default.jpg', upload_to='clients')),
            ],
        ),
        migrations.CreateModel(
            name='RecentWork',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100, verbose_name='Work Title')),
                ('image', models.ImageField(upload_to='works')),
            ],
        ),
        migrations.CreateModel(
            name='Service',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, verbose_name=' service name')),
                ('description', models.TextField(verbose_name='About Service')),
            ],
        ),
    ]
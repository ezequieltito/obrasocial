# Generated by Django 4.2.7 on 2023-11-08 18:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CarritoApp', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='medicamento',
            name='desc_medicamento',
            field=models.DecimalField(blank=True, decimal_places=2, max_digits=5, null=True),
        ),
    ]
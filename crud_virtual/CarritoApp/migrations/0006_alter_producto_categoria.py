# Generated by Django 4.2.7 on 2023-11-06 22:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CarritoApp', '0005_alter_producto_descuento'),
    ]

    operations = [
        migrations.AlterField(
            model_name='producto',
            name='categoria',
            field=models.CharField(max_length=33),
        ),
    ]

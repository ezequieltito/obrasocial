# Generated by Django 4.2.7 on 2023-11-06 21:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CarritoApp', '0004_producto_descuento_alter_producto_precio'),
    ]

    operations = [
        migrations.AlterField(
            model_name='producto',
            name='descuento',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=5),
        ),
    ]
# Generated by Django 4.2.7 on 2023-11-16 15:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CarritoApp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Stock',
            fields=[
                ('id_stock', models.AutoField(primary_key=True, serialize=False)),
                ('cantidad', models.IntegerField()),
            ],
            options={
                'db_table': 'stock',
                'managed': False,
            },
        ),
    ]

from django.db import models

class Medicamento(models.Model):
    id_medicamento = models.AutoField(primary_key=True)
    url = models.CharField( max_length=250)
    nombre_medicamento = models.CharField(max_length=150)
    desc_medicamento = models.DecimalField(max_digits=5, decimal_places=2, default=0)
    precio = models.IntegerField( null=True, blank=True)
    categoria = models.CharField(max_length=33)  # Agregar campo para la categoría

    def precio_con_descuento(self):
        if self.desc_medicamento is not None:
            return self.precio - (self.precio * (self.desc_medicamento / 100))
        else:
            return self.precio

    def __str__(self):
        return f'{self.nombre_medicamento} -> $ {self.precio} (Descuento: {self.desc_medicamento}%)'
    
    class Meta:
        managed = False
        db_table = 'medicamentos'

class Stock(models.Model):
    id_stock = models.AutoField(primary_key=True)
    id_medicamento = models.ForeignKey('Medicamento', models.DO_NOTHING, db_column='id_medicamento')
    cantidad = models.IntegerField()

    def __str__(self):
        return f'{self.id_medicamento.nombre_medicamento} - Cantidad: {self.cantidad}'

    class Meta:
        managed = False
        db_table = 'stock'


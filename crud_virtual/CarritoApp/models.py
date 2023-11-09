from django.db import models

class Medicamento(models.Model):
    id_medicamento = models.AutoField(primary_key=True)
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


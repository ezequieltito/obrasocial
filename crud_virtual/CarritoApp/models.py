from django.db import models


# Create your models here.
class Producto(models.Model):
    nombre = models.CharField(max_length=64)
    categoria = models.CharField(max_length=33)
    precio = models.IntegerField()  # Usar DecimalField para manejar decimales
    descuento = models.DecimalField(max_digits=5, decimal_places=2, default=0)  # Agregar un valor predeterminado

    @property
    def precio_con_descuento(self):
        return self.precio - (self.precio * (self.descuento / 100))

    def __str__(self):
        return f'{self.nombre} -> $ {self.precio} (Descuento: {self.descuento}%)'

    # Mantén este método para mantener la función __str__ existente


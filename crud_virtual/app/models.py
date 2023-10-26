from django.db import models

# Create your models here.
class correo(models.Model):
    Nombre=models.CharField(max_length=100)
    cuerpo=models.TextField()
    dato=models.DateTimeField()

    def __str__(self):
        return self.Nombre
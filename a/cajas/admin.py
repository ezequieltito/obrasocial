from django.contrib import admin
from CarritoApp.models import Cajas
# Register your models here.
@admin.register(Cajas)
class CajasAdmin(admin.ModelAdmin):
    list_display = ["inrocaja","dfechaapertura","fmontoapertura","iidempleado"]
# Cambiar el nombre en la vista de lista en el administrador
Cajas._meta.verbose_name_plural = "Gestión de Ventas"
    
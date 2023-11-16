from django.contrib import admin

# Register your models here.
from .models import Medicamento, Stock

@admin.register(Medicamento)
class MedicamentoAdmin(admin.ModelAdmin):
    list_display = ['id_medicamento', 'nombre_medicamento', 'precio', 'desc_medicamento', 'categoria']

@admin.register(Stock)
class StockAdmin(admin.ModelAdmin):
    list_display = ['id_stock', 'id_medicamento', 'cantidad']

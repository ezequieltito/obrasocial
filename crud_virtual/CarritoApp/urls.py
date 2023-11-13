from django.urls import path
from . import views

urlpatterns = [
    path('tienda/', views.tienda, name='tienda'),
    path('pagcarrito/', views.carrito, name='pagcarrito'),
    path('detalle/', views.detalle, name='detalle'),
    path('catalogos/', views.catalogo, name='catalogos'),
    path('catalogos/<str:categoria>/', views.catalogo, name='catalogos'),  # Incluye el parámetro "categoria"
    path('agregar/<int:medicamento_id>/', views.agregar_medicamento, name='Add'),  # Cambia "producto_id" a "medicamento_id"
    path('eliminar/<int:medicamento_id>/', views.eliminar_medicamento, name='Del'),  # Cambia "producto_id" a "medicamento_id"
    path('restar/<int:medicamento_id>/', views.restar_medicamento, name='Sub'),  # Cambia "producto_id" a "medicamento_id"
    path('limpiar/', views.limpiar_carrito, name='CLS'),
]



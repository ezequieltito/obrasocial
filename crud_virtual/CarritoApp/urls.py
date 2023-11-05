from django.urls import path
from .import views

urlpatterns = [
    path('tienda/',views.tienda, name='tienda'),
    path('pagcarrito/',views.carrito, name='pagcarrito'),
    path('catalogos/',views.catalogo, name='catalogos'),
    path('catalogos/<str:categoria>/', views.catalogo, name='catalogos'),  # Incluye el parámetro "categoria"
    path('agregar/<int:producto_id>/',views.agregar_producto,name='Add'),
    path('eliminar/<int:producto_id>/',views.eliminar_producto,name='Del'),
    path('restar/<int:producto_id>/',views.restar_producto,name='Sub'),
    path('limpiar/',views.limpiar_carrito,name='CLS'),
]   



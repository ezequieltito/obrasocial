from django.urls import path
from .import views


urlpatterns = [

    path('',views.pagina, name='farmacia'),
    path('farmacia.html', views.pagina, name='farmacia'),
    path('productos.html', views.producto, name='productos'),
]   

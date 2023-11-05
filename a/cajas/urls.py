from django.urls import path
from . import views

urlpatterns = [
    path('', views.administrarCajas.as_view(), name="Cajas"),   
]
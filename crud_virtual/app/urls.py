from django.urls import path
from .import views


urlpatterns = [
    path('',views.index, name='index'),
    path('index.html',views.index, name='index'),
    path('webd.html',views.login, name='webd'),
    path('form.html', views.registro, name='registro'),

]   



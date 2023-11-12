from django.urls import path
from .import views
from django.contrib import admin


urlpatterns = [
    path('',views.index, name='index'),
    path('quienessomos/',views.quienessomos, name='quienessomos'),

    path('contacto/',views.contacto, name='contacto'),
    path('servicios/',views.servicios, name='servicios'),
    path('preguntasfrecuentes/',views.preguntasfrecuentes, name='preguntasfrecuentes'),
    path('admin/', admin.site.urls, name='admin'),
    path('home/',views.index, name='home'),
    path('login/',views.login, name='login'),
    path('register/', views.register, name='register'),
    path('accounts/profile/', views.index, name='home'),
    path('logout/', views.exit, name="exit"),
]   



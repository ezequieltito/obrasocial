from django.shortcuts import render
from CarritoApp.models import Cajas
# from CarritoApp.models import Empleados
# from CarritoApp.models import Sucursales
from django.views.generic import TemplateView
from loguinApp.mixins import AuthGroupRequiredMixin

# Create your views here.
class administrarCajas(AuthGroupRequiredMixin, TemplateView):
    template_name = 'cajas.html'
    groups_required = ['Administrador','Operador']  # Lista de grupos requeridos

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Agrega el modelo de productos al contexto
        context['cajas'] = Cajas.objects.all()  # Esto obtendrá todos los productos  
        # Puedes agregar cualquier otro contexto que desees aquí
        context['title'] = 'Administración de Cajas'
        return context

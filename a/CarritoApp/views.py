from .Carrito import Carrito
from CarritoApp.models import Productos
from django.views.generic import TemplateView
from loguinApp.mixins import AuthGroupRequiredMixin
from django.shortcuts import redirect
from django.views.decorators.http import require_http_methods
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import user_passes_test
from django.urls import reverse_lazy
###########begin debugg consola###################

# se importa solo pra mostrar los logger en la consola de ejecucion
import logging

# Configuración del registro
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

# Configuración del controlador para la consola
console_handler = logging.StreamHandler()
console_handler.setLevel(logging.DEBUG)
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
console_handler.setFormatter(formatter)
logger.addHandler(console_handler)
###########end debugg consola###################

# def usuario_puede_modificar_carrito(user):
#     return user.groups.filter(name__in=['Administrador', 'Operador']).exists()

class tienda(AuthGroupRequiredMixin, TemplateView):
    template_name = 'tienda.html'
    groups_required = ['Administrador','Operador','Usuario']  # Lista de grupos requeridos


    #######begin: codigo necesario solo para ver la salida del mixins en consola####
    #logger.debug("Entrando al método dispatch")
    #@method_decorator(user_passes_test(usuario_puede_modificar_carrito, login_url=reverse_lazy('login')))
    def dispatch(self, request, *args, **kwargs):
        logger.debug("Entrando al método dispatch")
        user = self.request.user
        logger.debug(f"Grupos del usuario: {user.groups.all()}")
        result = super().dispatch(request, *args, **kwargs)
        logger.debug("Saliendo del método dispatch")
        return result
    
    #######end: codigo necesario solo para ver la salida del mixins en consola####

    def get_context_data(self, **kwargs):
        print("Eget contxt")
        context = super().get_context_data(**kwargs)
        # Agrega el modelo de productos al contexto
        context['productos'] = Productos.objects.all()  # Esto obtendrá todos los productos  
        # Puedes agregar cualquier otro contexto que desees aquí
        context['title'] = 'Carrito de Compras'
        return context
    
#@user_passes_test(lambda u: u.groups.filter(name__in=['Administrador', 'Operador']).exists(), login_url=reverse_lazy('login'))
def agregar_producto(request, producto_id):
    carrito = Carrito(request)
    producto = Productos.objects.get(iidproducto=producto_id)
    carrito.agregar(producto)
    return redirect("Tienda")

#@user_passes_test(lambda u: u.groups.filter(name__in=['Administrador', 'Operador']).exists(), login_url=reverse_lazy('login'))
def eliminar_producto(request, producto_id):
    carrito = Carrito(request)
    producto = Productos.objects.get(iidproducto=producto_id)
    carrito.eliminar(producto)
    
#@user_passes_test(lambda u: u.groups.filter(name__in=['Administrador', 'Operador']).exists(), login_url=reverse_lazy('login'))
def restar_producto(request, producto_id):
    carrito = Carrito(request)
    producto = Productos.objects.get(iidproducto=producto_id)
    carrito.restar(producto)
    return redirect("Tienda")

#@user_passes_test(lambda u: u.groups.filter(name__in=['Administrador', 'Operador']).exists(), login_url=reverse_lazy('login'))
def limpiar_carrito(request):
    carrito = Carrito(request)
    carrito.limpiar()
    return redirect("Tienda")
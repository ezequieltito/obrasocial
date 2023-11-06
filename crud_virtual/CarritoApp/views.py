from django.shortcuts import render, HttpResponse
from .carrito import Carrito
from .models import Producto
from django.shortcuts import redirect
from django.contrib.auth.decorators import login_required

# Create your views heres


def catalogo(request, categoria=None):
    carrito = Carrito(request)
    productos = Producto.objects.all()
    ofertas = Producto.objects.filter(descuento__gt=0)
    cant_productos = carrito.obtener_cantidad_total()

    if categoria:
        productos = productos.filter(categoria=categoria)

    context = {
        'productos': productos,
        'categoria': categoria,
        'ofertas': ofertas,
        'cant_productos': cant_productos,
    }

    return render(request, 'catalogos.html', context)

@login_required
def carrito(request):
    carrito = Carrito(request)
    cant_productos = carrito.obtener_cantidad_total()  # Obtén la cantidad total desde el objeto Carrito

    context = {
        'cant_productos': cant_productos,
    }

    return render(request, 'pagcarrito.html', context)


def tienda(request):
    carrito = Carrito(request)
    cant_productos = carrito.obtener_cantidad_total()  # Obtén la cantidad total desde el objeto Carrito

    productos = Producto.objects.all()

    context = {
        'productos': productos,
        'cant_productos': cant_productos,
    }

    return render(request, "index.html", context)

def agregar_producto(request, producto_id):
    carrito = Carrito(request)
    producto = Producto.objects.get(id=producto_id)
    cantidad = int(request.POST.get('cantidad', 1))  # Obtiene la cantidad del formulario
    carrito.agregar(producto, cantidad)

    return redirect(request.META.get('HTTP_REFERER'))


def eliminar_producto(request, producto_id):
    carrito = Carrito(request)
    producto = Producto.objects.get(id=producto_id)
    carrito.eliminar(producto)
    

def restar_producto(request, producto_id):
    carrito = Carrito(request)
    producto = Producto.objects.get(id=producto_id)
    carrito.restar(producto)

            
    return redirect(request.META.get('HTTP_REFERER'))


def limpiar_carrito(request):
    carrito = Carrito(request)
    carrito.limpiar()
    return redirect(request.META.get('HTTP_REFERER'))
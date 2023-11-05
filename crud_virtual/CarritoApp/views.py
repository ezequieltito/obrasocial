from django.shortcuts import render, HttpResponse
from .carrito import Carrito
from .models import Producto
from django.shortcuts import redirect
from django.contrib.auth.decorators import login_required

# Create your views heres


def catalogo(request, categoria=None):
    productos = Producto.objects.all()  # Obtén todos los productos por defecto

    if categoria:
        productos = Producto.objects.filter(categoria=categoria)  # Filtra por categoría si se proporciona

    else:
        productos = Producto.objects.all()

    context = {
        'productos': productos,
        'categoria': categoria,
    }
    return render(request, 'catalogos.html', context)

@login_required
def carrito(request):

    context={
    }
    return render(request,'pagcarrito.html',context)


def tienda(request):
     productos = Producto.objects.all()
     return render(request, "index.html", {'productos':productos})
    #return HttpResponse("hola")

def agregar_producto(request, producto_id):
    carrito = Carrito(request)
    producto = Producto.objects.get(id=producto_id)
    carrito.agregar(producto)

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
from django.shortcuts import render, HttpResponse

from app.models import Direcciones
from .carrito import Carrito
from .models import Medicamento, Stock  # Importa el modelo Medicamento en lugar de Producto
from django.shortcuts import redirect
from django.contrib.auth.decorators import login_required

# Resto de tus importaciones y código de vistas

def catalogo(request, categoria=None):
    carrito = Carrito(request)
    medicamentos = Medicamento.objects.all()  # Cambia Producto a Medicamento
    ofertas = Medicamento.objects.filter(desc_medicamento__gt=0)  # Cambia descuento a desc_medicamento
    cant_medicamentos = carrito.obtener_cantidad_total()  # Cambia obtener_cantidad_total a obtener_cantidad_total

    if categoria:
        medicamentos = medicamentos.filter(categoria=categoria)

    context = {
        'medicamentos': medicamentos,
        'categoria': categoria,
        'ofertas': ofertas,
        'cant_medicamentos': cant_medicamentos,
    }

    return render(request, 'catalogos.html', context)

@login_required
def carrito(request):
    carrito = Carrito(request)
    cant_medicamentos = carrito.obtener_cantidad_total()  # Cambia obtener_cantidad_total a obtener_cantidad_total

    context = {
        'cant_medicamentos': cant_medicamentos,
    }

    return render(request, 'pagcarrito.html', context)

def detalle(request):
    afiliado = request.user.afiliados
    direccion = Direcciones.objects.get(pk=afiliado.id_direccion)
    cant_medicamentos = Carrito(request).obtener_cantidad_total()

    context = {
        'cant_medicamentos': cant_medicamentos,
        'afiliado': afiliado,
        'direccion': direccion,
    }

    return render(request, 'detalle.html', context)


def tienda(request):
    carrito = Carrito(request)
    cant_medicamentos = carrito.obtener_cantidad_total()

    medicamentos = Medicamento.objects.all()

    context = {
        'medicamentos': medicamentos,
        'cant_medicamentos': cant_medicamentos,
    }

    return render(request, "index.html", context)

def agregar_medicamento(request, medicamento_id):
    carrito = Carrito(request)
    medicamento = Medicamento.objects.get(id_medicamento=medicamento_id)
    cantidad = int(request.POST.get('cantidad', 1))
    carrito.agregar(medicamento, cantidad)
    return redirect(request.META.get('HTTP_REFERER'))


def eliminar_medicamento(request, medicamento_id):
    carrito = Carrito(request)
    medicamento = Medicamento.objects.get(id_medicamento=medicamento_id)
    carrito.eliminar(medicamento)
    return redirect(request.META.get('HTTP_REFERER'))

def restar_medicamento(request, medicamento_id):
    carrito = Carrito(request)
    medicamento = Medicamento.objects.get(id_medicamento=medicamento_id)
    carrito.restar(medicamento)
    return redirect(request.META.get('HTTP_REFERER'))

def limpiar_carrito(request):
    carrito = Carrito(request)
    carrito.limpiar()
    return redirect(request.META.get('HTTP_REFERER'))

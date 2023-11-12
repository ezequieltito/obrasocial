from django.shortcuts import render, redirect
from .forms import CustomUserCreationForm 
from django.contrib.auth import login, authenticate
from django.contrib.auth import logout
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .forms import CustomUserCreationForm
from CarritoApp.models import Medicamento  # Importa el modelo Medicamento en lugar de Producto
from CarritoApp.carrito import Carrito  # Asegúrate de importar la clase Carrito

# Resto de tus importaciones y código de vistas

def preguntasfrecuentes(request):
    return render(request, 'fotter/preguntasfrecuentes.html')

def contacto(request):
    return render(request, 'fotter/contacto.html')

def servicios(request):
    return render(request, 'fotter/servicios.html')

def quienessomos(request):
    return render(request, 'fotter/quienessomos.html')


def index(request):
    carrito = Carrito(request)
    cant_medicamentos = carrito.obtener_cantidad_total()  # Cambia obtener_cantidad_total a obtener_cantidad_total

    # Consulta los medicamentos con descuento (por ejemplo, aquellos con descuento mayor a 0%)
    medicamentos_con_descuento = Medicamento.objects.filter(desc_medicamento__gt=0)  # Cambia descuento a desc_medicamento

    context = {
        'cant_medicamentos': cant_medicamentos,
        'medicamentos_con_descuento': medicamentos_con_descuento,  # Pasa los medicamentos con descuento al contexto
    }
    return render(request, 'content-home.html', context)

def register(request):
    data = {
        'form': CustomUserCreationForm()
    }
    if request.method == 'POST':
        user_creation_form = CustomUserCreationForm(data=request.POST)
        if user_creation_form.is_valid():
            user_creation_form.save()

            messages.success(request, "Inicie sesión para continuar")
            return redirect('login')
        else:
            data['form'] = user_creation_form

            user = authenticate(username=user_creation_form.cleaned_data['username'], password=user_creation_form.cleaned_data['password1'])
            login(request, user)

    return render(request, 'registration/register.html', data)

@login_required
def login(request):
    return render(request, 'login.html')

def exit(request):
    logout(request)
    return redirect('home')

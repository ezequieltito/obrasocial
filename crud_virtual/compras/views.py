from django.shortcuts import render
from app.models import correo


def pagina(request):

    context={
    }
    return render(request,'farmacia.html',context)
def producto(request):

    context={
    }
    return render(request,'productos.html',context)

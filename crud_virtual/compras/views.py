from django.shortcuts import render
from django.contrib.auth.decorators import login_required


@login_required
def pagina(request):

    context={
    }
    return render(request,'farmacia.html',context)


@login_required
def producto(request):

    context={
    }
    return render(request,'productos.html',context)

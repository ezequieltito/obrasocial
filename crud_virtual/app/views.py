from django.shortcuts import render,redirect
from django.http import HttpResponse
from .models import correo
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import login, authenticate
from django.urls import reverse

# Create your views here.
def index(request):

    context={
    }
    return render(request,'index.html',context)


def login(request):
    return render(request,'webd.html')

def registro(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=password)
            login(request, user)
            return redirect('webd.html')  # Redirige a la página de inicio de sesión

    else:
        form = UserCreationForm()
        
    return render(request, 'form.html', {'form': form})

















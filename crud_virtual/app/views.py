from django.shortcuts import render,redirect
from .forms import CustomUserCreationForm 
from django.contrib.auth import login, authenticate
from django.contrib.auth import logout
from django.contrib.auth.decorators import login_required
from django.contrib import messages

from .forms import CustomUserCreationForm

# Create your views here.
def index(request):

    context={
    }
    return render(request,'content-home.html',context)


def register(request):
   data = {
        'form': CustomUserCreationForm()
    }
    #validar los campos que vienen del form de register
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
            
   return render(request,'registration/register.html', data)

@login_required
def login(request):
    return render(request,'login.html')

from django.shortcuts import redirect



def exit(request):
    logout(request)
    return redirect('home')

















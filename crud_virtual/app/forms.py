from django import forms
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.contrib.auth.models import User, Group

class CustomLoginForm(AuthenticationForm):
    # Puedes personalizar el formulario aquí si es necesario

    # Agregar campos adicionales o personalizar los campos existentes
    username = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Nombre de usuario'}),
    )
    
    password = forms.CharField(
        widget=forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Contraseña'}),
    )

class CustomUserCreationForm(UserCreationForm):
	email = forms.EmailField(required=True)

	class Meta:
		model = User
		fields = ['username', 'first_name', 'last_name', 'email', 'password1', 'password2']
	def clean_email(self):
		email = self.cleaned_data['email']

		if User.objects.filter(email=email).exists():
			raise forms.ValidationError('Este correo electrónico ya está registrado')
		return email
	
	def save(self, commit=True):
		user = super().save(commit=False)
		user.save()        
        # Una vez que el usuario se ha guardado en la base de datos, agrégalo al grupo "Usuario"
		grupo_usuario, created = Group.objects.get_or_create(name='Usuario')
		user.groups.add(grupo_usuario)
		return user
       
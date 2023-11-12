from django import forms
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.contrib.auth.models import User, Group
from .models import Afiliados, TipoPlanes

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
    # Agrega el campo de selección desde el modelo TipoPlanes
    id_tipoPlan = forms.ModelChoiceField(queryset=TipoPlanes.objects.all(), required=False)
    # Agrega el campo de entrada para el dni_afi
    dni_afi = forms.IntegerField(required=False)

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
        # Guarda el campo de selección en el modelo Afiliados
        id_tipoPlan = self.cleaned_data.get('id_tipoPlan')
        dni_afi = self.cleaned_data.get('dni_afi')
        if id_tipoPlan:
            afiliado = Afiliados.objects.create(
                user=user,
                id_tipoPlan=id_tipoPlan,
                # Agrega otros campos según sea necesario
                nombre_afi=user.first_name,
                apellido_afi=user.last_name,
                dni_afi=dni_afi,
                user_id=user.id,
            )

        # Una vez que el usuario se ha guardado en la base de datos, agrégalo al grupo "Usuario" por defecto
        grupo_usuario, created = Group.objects.get_or_create(name='Usuario')
        user.groups.add(grupo_usuario)
        return user

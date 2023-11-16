from django import forms
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.contrib.auth.models import User, Group
from .models import Afiliados, TipoPlanes,Direcciones

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
    id_tipoPlan = forms.ModelChoiceField(queryset=TipoPlanes.objects.all(), required=False)
    documento = forms.IntegerField(label='Documento', required=False)
    tel_afi = forms.IntegerField(label='Teléfono', required=False)
    fecha_nac_afi = forms.DateField(
        label='Fecha de Nacimiento',
        widget=forms.DateInput(attrs={'type': 'date'}),
        required=False
    )
    provincia = forms.CharField(max_length=100, initial="Salta", widget=forms.TextInput(attrs={'readonly': 'readonly'}))
    localidad = forms.CharField(max_length=100, initial="Salta Capital", widget=forms.TextInput(attrs={'readonly': 'readonly'}))
    calle = forms.CharField(max_length=300, required=True)
    numero = forms.IntegerField(required=True)


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

        direccion = Direcciones.objects.create(
            calle=self.cleaned_data['calle'],
            numero=self.cleaned_data['numero'],
        )
        user.direccion = direccion
        user.save()

        id_tipoPlan = self.cleaned_data.get('id_tipoPlan')
        documento = self.cleaned_data.get('documento')
        tel_afi = self.cleaned_data.get('tel_afi')
        fecha_nac_afi = self.cleaned_data.get('fecha_nac_afi')

        if id_tipoPlan:
            afiliado = Afiliados.objects.create(
                user=user,
                id_tipoPlan=id_tipoPlan,
                nombre_afi=user.first_name,
                apellido_afi=user.last_name,
                dni_afi=documento,
                id_direccion=direccion.id_direccion,  # Ajusta el nombre según tu modelo
                mail_afi=user.email,
                tel_afi=tel_afi,
                fecha_nac_afi=fecha_nac_afi,
            )

        grupo_usuario, created = Group.objects.get_or_create(name='Usuario')
        user.groups.add(grupo_usuario)
        return user
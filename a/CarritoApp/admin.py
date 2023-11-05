from django.contrib import admin
from CarritoApp.models import Empleados, TipoEmpleado, TipoProductos, Productos, Sucursales


# Register your models here.
@admin.display(description="TipoEmpleado")
def tipoEmpleado(obj):
    return f"{obj.stipoempleado}"

@admin.register(TipoEmpleado)
class TipoEmpleadoAdmin(admin.ModelAdmin):
    list_display = ["iidtipoempleado", "stipoempleado"]

@admin.display(description="Nombre")
def upper_case_name(obj):
    return f"{obj.snombre}".upper()

@admin.display(description="Apellido")
def upper_case_apellido(obj):
    return f"{obj.sapellido}".upper()

@admin.display(description="Documento")
def documento(obj):
    return f"{obj.idni}"

@admin.display(description="Tipo_Empleado")
def tipoEmp(obj):
    return f"{obj.iidtipoempleado}"

@admin.register(Empleados)
class EmpleadosAdmin(admin.ModelAdmin):
    list_display = [tipoEmp,upper_case_name, upper_case_apellido, documento]    
    search_fields = ["snombre", "sapellido"]
    list_per_page = 5
    list_select_related = True

@admin.display(description="Tipo de producto")
def tipoProducto(obj):
    return f"{obj.snombretipoproducto}"

@admin.register(TipoProductos)
class TipoProductosAdmin(admin.ModelAdmin):
    list_display = [tipoProducto]

@admin.register(Productos)
class ProductosAdmin(admin.ModelAdmin):
    list_display = ["iidtipoproducto","snombreproducto","sdescripcion","istock","dprecio","surl"]


@admin.register(Sucursales)
class SucursalesAdmin(admin.ModelAdmin):
    list_display = ["snombre"]
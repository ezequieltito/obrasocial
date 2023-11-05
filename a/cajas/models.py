from django.db import models
# from CarritoApp.models import Cajas, Empleados, Sucursales

# # Create your models here.

# class Cajas(models.Model):
#     iidcaja = models.BigAutoField(db_column='iIdCaja', primary_key=True)  # Field name made lowercase.
#     inrocaja = models.IntegerField(db_column='iNroCaja')  # Field name made lowercase.
#     dfechaapertura = models.DateTimeField(db_column='dFechaApertura')  # Field name made lowercase.
#     dfechacierre = models.DateTimeField(db_column='dFechaCierre')  # Field name made lowercase.
#     fmontoapertura = models.DecimalField(db_column='fMontoApertura', max_digits=8, decimal_places=2)  # Field name made lowercase.
#     fmontocierre = models.DecimalField(db_column='fMontoCierre', max_digits=8, decimal_places=2)  # Field name made lowercase.
#     iidempleado = models.ForeignKey('Empleados', models.DO_NOTHING, db_column='iIdEmpleado')  # Field name made lowercase.
#     iidsucursal = models.ForeignKey('Sucursales', models.DO_NOTHING, db_column='iIdSucursal')  # Field name made lowercase.
#     created_at = models.DateTimeField(blank=True, null=True)
#     updated_at = models.DateTimeField(blank=True, null=True)

#     class Meta:
#         managed = False
#         db_table = 'cajas'



from django.urls import path
from .views import CargarDatosExcel

urlpatterns = [
    # La URL dentro de la app será 'productos/'
    path('productos/', CargarDatosExcel.as_view(), name='cargar_productos'), 
]
from django.urls import path
from API_operadoras.views import *
urlpatterns = [
    path('buscar-operadoras/', search, name='buscar_operadoras')
]
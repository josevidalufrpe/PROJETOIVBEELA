from django.db import models
from django.forms import ModelForm
# Create your models here.

class Usuario(models.Model):
	userEmail = models.EmailField(max_length=100)
	userSenha = models.CharField(max_length=100)
	userToken = models.CharField(max_length=250,null=True)

class Pessoa(models.Model):
	userId     = models.IntegerField(max_length=10)
	pessoaNome = models.CharField(max_length=250)

class Lugar(models.Model):
	lugarNome      = models.CharField(max_length=250)
	lugarRank      = models.IntegerField(max_length=10)
	lugarTipo 	   = models.CharField(max_length=50,null=True)
	lugarLatitude  = models.CharField(max_length=50,null=True)
	lugarLongitude = models.CharField(max_length=50,null=True)
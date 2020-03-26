from django.db import models
from django.forms import ModelForm
# Create your models here.

class Usuario(models.Model):
	userEmail = models.EmailField(max_length=100)
	userSenha = models.CharField(max_length=100)
class Meta:
	db_table = "tbusuario"
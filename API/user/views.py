from django.shortcuts import render, redirect
from django.http import HttpResponse

from user.form import UsuarioForm
from user.models import Usuario

# Create your views here.
def registro(request):
	if request.method =="POST":
		form = UsuarioForm(request.POST)
		if form.is_valid():
			try:
				form.save()
				return redirect('/dashboard')
			except:
				pass
	else:
		form = UsuarioForm()
	return render(request, "index.html",{'form':form})
def dashboard(request):
	usuarios = Usuario.objects.all()
	return render(request,"form_1.html",{'usuarios':usuarios})
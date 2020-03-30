from django.shortcuts import render, redirect
from django.http import HttpResponse,JsonResponse

from user.form import UsuarioForm
from user.models import Usuario

import json
import facebook


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
def graph(request):
	#
	#Usuario.objects.get("")
	#precisa passar o token aqui
	token = "EAADIGMeKxFQBACuZCACjVkmzdcvHmk1RZBBHJGzZBkU6mKOk8w6gNheX3Xdgj6BZBKeGJ07IWvn5AvN1zUEt3LvzSYOpsAZBgNxxoqA5WaEi7J93nfZCNd3jpu86JLgwcMfU1zwQJFn6Mh1TK88kAarZA4fNJPOkBSBZCpN5ZBjjqHXedBdUtyxChKLJIaOBthebfHqNvM4ZCuELH7CyA8AWrAWuijOzSDpqO2aFkW7azG0QZDZD"
	profile = facebook.GraphAPI(token).get_object('me',fields="first_name,email,posts")
	profile = json.dumps(profile,indent=3)
	return JsonResponse({'facebook':profile})
	
from django import forms
from user.models import Usuario

class UsuarioForm(forms.ModelForm):
	#declara o tipo
	userSenha = forms.CharField(widget=forms.PasswordInput)
	def clean_email(self):
		UserEmail = self.cleaned_data['userEmail']
		if UserEmail:
			usuario = Usuario.objects.filter(userEmail=UserEmail).extis()
			if usuario:
				raise forms.ValidationError(u'E-mail já existente!')
			return UserEmail
	class Meta:
		model = Usuario
		fields ="__all__"

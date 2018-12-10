from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from Harmony.models import File
from django import forms


class FileForm(forms.ModelForm):
    class Meta:
        model= File
        fields= ["filename", "filepath"]

class CreateUserForm(UserCreationForm): # 내장 회원가입 폼을 상속받아서 확장한다.
    class Meta:
        model = User
        fields = ("username", "password")

    def save(self, commit=True): # 저장하는 부분 오버라이딩
        user = super(CreateUserForm, self).save(commit=False) # 본인의 부모를 호출해서 저장하겠다.
        if commit:
            user.save()
        return user

class LoginForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['username', 'password'] # 로그인 시에는 유저이름과 비밀번호만 입력 받는다.
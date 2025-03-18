from django import forms
from .models import Event, Registration,priority_of_submission_options
from django.contrib.auth.forms import  UserCreationForm
from account.models import User
from django.contrib.auth.models import Group

class Signup_Form(UserCreationForm):    
    groups = forms.ModelMultipleChoiceField(widget=forms.CheckboxSelectMultiple, queryset=Group.objects.filter(name__in=('Producer','Writer','Director')))
    class Meta:
        model = User
        fields = '__all__'

    def __init__(self, *args, **kwargs):
        super(Signup_Form, self).__init__(*args, **kwargs)



class Event_Form(forms.ModelForm):
    open_date = forms.DateField(widget=forms.TextInput(attrs={'type': 'date'} ))
    close_date = forms.DateField(widget=forms.TextInput(attrs={'type': 'date'} ))

    class Meta:
        model = Event
        fields = ['title','open_date','close_date','description']

    def __init__(self,*args, **kwargs):
        self.request = kwargs.pop("request")
        super(Event_Form, self).__init__(*args, **kwargs)




class Event_Registration(forms.ModelForm):
    priority_of_submission = forms.ChoiceField(choices=priority_of_submission_options, widget=forms.RadioSelect(attrs={'class':'priority'}))

    class Meta:
        model = Registration
        fields = '__all__'
        exclude = ['user','event']
        

    def __init__(self,*args, **kwargs):
        super(Event_Registration, self).__init__(*args, **kwargs)
        self.fields['language'].required = True
        self.fields['writer'].label = "Writer (Story, Screenplay, Dialog)"
        self.fields['script'].widget.attrs['class'] = 'form-control'
        self.fields['video_link'].widget.attrs['class'] = 'form-control'
        self.fields['synopsis'].label = "Synopsis of the story/short film (100 words))"
        self.fields['synopsis'].required = True
        self.fields['script_password'].label = "Script Password (Optional)"
        self.fields['video_password'].label = "Video Link Password (Optional)"
        self.fields['subtitles'].label = "Subtitles (English)"

        self.fields["year_of_production"].choices = [("", "Choose year of Production"),] + \
            list(self.fields["year_of_production"].choices)[1:]

        self.fields["language"].choices = [("", "Choose Language"),] + \
            list(self.fields["language"].choices)[1:]

        self.fields["subtitles"].choices = [("", "Choose"),] + \
            list(self.fields["subtitles"].choices)[1:]


class Signup_Form(UserCreationForm):    
    age= forms.IntegerField()
    profession = forms.CharField()
    marital_status = forms.CharField()
    
    
    class Meta:
        model = User
        fields = ('first_name','mobile_no','gender','email','password1', 'password2','age','profession','marital_status')
        labels = {
            "first_name": "Name"
        
        }

    def __init__(self, *args, **kwargs):
        super(Signup_Form, self).__init__(*args, **kwargs)
        self.fields['first_name'].required = True
        self.fields['mobile_no'].required = True
        self.fields['age'].required = True
        self.fields['profession'].required = True
        self.fields['marital_status'].required = True
        self.fields['password1'].widget.attrs['class'] = 'form-control'
        self.fields['password2'].widget.attrs['class'] = 'form-control'

        for fieldname in ['password1', 'password2']:
            self.fields[fieldname].help_text = None


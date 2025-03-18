from PIL import Image
from django import forms
from django.core.files import File
from django.forms import fields
from .models import User, Assistant, Highlight,Qualification, Award, Project, Testimonial, Report_People, Company,Open_To,Genre, Format, Language,  Join_Project
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.forms.widgets import PasswordInput, TextInput
from project.models import Project
from django.contrib.auth.models import Group
from django.contrib.auth import (
    authenticate, get_user_model, password_validation,
)
from django.db.models import Q


class CustomAuthForm(AuthenticationForm):
    username = forms.CharField(widget=TextInput(attrs={'placeholder': 'Mobile No','class' : 'reg_form_input_1'}))
    password = forms.CharField(widget=PasswordInput(attrs={'placeholder':'Password','class' : 'reg_form_input_1'}))
    not_active =  forms.CharField(widget=forms.HiddenInput(), initial="value")

    

    def __init__(self, *args, **kwargs):
        self.error_messages['invalid_login'] = 'If you not verified kindly verify it'
        super(CustomAuthForm, self).__init__(*args, **kwargs)
        self.fields['username'].label = "Mobile No"
        self.fields['not_active'].required = False
        self.fields['password'].widget.attrs['class'] = 'form-control'


    def clean(self):
        username = self.cleaned_data.get('username')
        password = self.cleaned_data.get('password')

        if username is not None and password:
            user  = User.objects.filter(Q(username__iexact=username) | Q(mobile_no__iexact=username)).order_by('id').first()
            if user:
                if not user.is_active:
                    error_message = 'User account not active'
                    field = 'not_active'
                    self.add_error(field, error_message)

            self.user_cache = authenticate(self.request, username=username, password=password)
            if self.user_cache is None:
                raise self.get_invalid_login_error()
            else:
                self.confirm_login_allowed(self.user_cache)

        return self.cleaned_data



class Signup_Form(UserCreationForm):    
    groups = forms.ModelMultipleChoiceField(widget=forms.CheckboxSelectMultiple, queryset=Group.objects.filter(name__in=('Producer','Writer','Director')))
    class Meta:
        model = User
        fields = ('first_name','last_name','mobile_no','email','password1', 'password2','groups')

    def __init__(self, *args, **kwargs):
        super(Signup_Form, self).__init__(*args, **kwargs)
        self.fields['first_name'].required = True
        self.fields['mobile_no'].required = True
        self.fields['groups'].label = "Role"
        self.fields['password1'].widget.attrs['class'] = 'form-control'
        self.fields['password2'].widget.attrs['class'] = 'form-control'

        for fieldname in ['password1', 'password2']:
            self.fields[fieldname].help_text = None


class Edit_Profile_Form(forms.ModelForm):
    x = forms.FloatField(widget=forms.HiddenInput())
    y = forms.FloatField(widget=forms.HiddenInput())
    width = forms.FloatField(widget=forms.HiddenInput())
    height = forms.FloatField(widget=forms.HiddenInput())
    dob = forms.DateField(widget=forms.TextInput(attrs={'type': 'date'} ))
    groups = forms.ModelMultipleChoiceField(widget=forms.CheckboxSelectMultiple, queryset=Group.objects.filter(name__in=('Producer','Writer','Director')))
    open_to = forms.ModelMultipleChoiceField(widget=forms.CheckboxSelectMultiple, queryset=Open_To.objects.all())
    specialization_of_genre = forms.ModelMultipleChoiceField(widget=forms.CheckboxSelectMultiple, queryset=Genre.objects.all())
    interested_format = forms.ModelMultipleChoiceField(widget=forms.CheckboxSelectMultiple, queryset=Format.objects.all())
    languages_to_work = forms.ModelMultipleChoiceField(widget=forms.CheckboxSelectMultiple, queryset=Language.objects.all())


    class Meta:
        model = User
        fields = ('first_name','last_name','gender','dob','mobile_no','no_of_filims_worked','location','address','groups','open_to','specialization_of_genre','interested_format','languages_to_work','profile_photo','make_mobile_no_visible','make_address_visible','get_notification','x','y','width', 'height','other_genre','other_language' )



    def __init__(self, *args, **kwargs):
        super(Edit_Profile_Form, self).__init__(*args, **kwargs)
        self.fields['first_name'].required = True
        self.fields['gender'].required = True
        self.fields['dob'].required = True
        self.fields['mobile_no'].required = True
        self.fields['mobile_no'].widget.attrs['readonly'] = True
        self.fields['location'].required = True
        self.fields['address'].required = True
        self.fields['groups'].required = True
        self.fields['groups'].label = "Role"
        self.fields['specialization_of_genre'].required = True
        self.fields['interested_format'].required = True
        self.fields['languages_to_work'].required = True
        self.fields['x'].required = False
        self.fields['y'].required = False
        self.fields['other_language'].required = False
        self.fields['other_genre'].required = False
        self.fields['open_to'].required = False
        
        self.fields['width'].required = False
        self.fields['height'].required = False
        self.fields['other_genre'].widget.attrs['placeholder'] = 'Specify if other genre'
        self.fields['other_language'].widget.attrs['placeholder'] = 'Specify if other language'

        self.fields["location"].choices = [("", "Choose Location"),] + \
            list(self.fields["location"].choices)[1:]

        self.fields['groups'].widget.attrs['class'] = 'user_group'
        self.fields['specialization_of_genre'].widget.attrs['class'] = 'specialization_of_genre'
        self.fields['languages_to_work'].widget.attrs['class'] = 'languages_to_work'

    def save(self):
        user = super(Edit_Profile_Form, self).save()

        if 'profile_photo' in self.changed_data:
            x = self.cleaned_data.get('x')
            y = self.cleaned_data.get('y')
            w = self.cleaned_data.get('width')
            h = self.cleaned_data.get('height')
            try:
                image = Image.open(user.profile_photo)
                cropped_image = image.crop((x, y, w+x, h+y))
                resized_image = cropped_image.resize((200, 200), Image.ANTIALIAS)
                resized_image.save(user.profile_photo.path)
            except:
                return user
        return user


class Project_Form(forms.ModelForm):    
    x = forms.FloatField(widget=forms.HiddenInput())
    y = forms.FloatField(widget=forms.HiddenInput())
    width = forms.FloatField(widget=forms.HiddenInput())
    height = forms.FloatField(widget=forms.HiddenInput())
    genre = forms.ModelMultipleChoiceField(widget=forms.CheckboxSelectMultiple, queryset=Genre.objects.all())
    release_date = forms.DateField(widget=forms.TextInput(attrs={'type': 'date'} ))
    image = forms.ImageField(label='Poster')
    language = forms.ModelMultipleChoiceField(widget=forms.CheckboxSelectMultiple, queryset=Language.objects.all())
   

    class Meta:
        model = Project
        fields = ('title','year','genre','language','budget','release_date','image','status','imdb_link','x','y','width','height')

    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop("request")
        super(Project_Form, self).__init__(*args, **kwargs)
        self.fields['x'].required = False
        self.fields['y'].required = False
        self.fields['width'].required = False
        self.fields['height'].required = False
        self.fields['budget'].required = False
        self.fields['image'].required = False
        self.fields['release_date'].required = False
        self.fields['year'].label = "Project Year"
        self.fields['imdb_link'].widget.attrs['class'] = 'form-control'
        self.fields['image'].widget.attrs['class'] = 'form-control'
        self.fields['budget'].widget.attrs['placeholder'] = 'Enter the budget in crores'
        
        

    '''
    def save(self):
        project = super(Project_Form, self).save()

        if 'image' in self.changed_data:
            x = self.cleaned_data.get('x')
            y = self.cleaned_data.get('y')
            w = self.cleaned_data.get('width')
            h = self.cleaned_data.get('height')
            print(x)
            image = Image.open(user.profile_photo)
            cropped_image = image.crop((x, y, w+x, h+y))
            resized_image = cropped_image.resize((200, 200), Image.ANTIALIAS)
            resized_image.save(project.image.path)
        return project

    '''

class Assistant_Form(forms.ModelForm):

    class Meta:
        model = Assistant 
        fields = ['senior_link','senior','project','year']

    def __init__(self,*args, **kwargs):
        self.request = kwargs.pop("request")
        super(Assistant_Form, self).__init__(*args, **kwargs)
        self.fields['senior_link'].queryset = User.objects.filter(id=0)
        self.fields["senior_link"].choices = [("", "Choose Senior"),] + \
                list(self.fields["senior_link"].choices)[1:]
        self.fields['senior_link'].label = "Senior"


class Highlight_Form(forms.ModelForm):
    class Meta:
        model = Highlight
        fields = ['title','content',]


    def __init__(self,*args, **kwargs):
        self.request = kwargs.pop("request")
        super(Highlight_Form, self).__init__(*args, **kwargs)


   

class Qualification_Form(forms.ModelForm):

    class Meta:
        model = Qualification
        fields = ['degree','institute','year']

    def __init__(self,*args, **kwargs):
        self.request = kwargs.pop("request")
        super(Qualification_Form, self).__init__(*args, **kwargs)


class Award_Form(forms.ModelForm):
    x = forms.FloatField(widget=forms.HiddenInput())
    y = forms.FloatField(widget=forms.HiddenInput())
    width = forms.FloatField(widget=forms.HiddenInput())
    height = forms.FloatField(widget=forms.HiddenInput())

    class Meta:
        model = Award
        fields = ['title','year','banner','image','x','y','width','height']

    def __init__(self,*args,post_data=None, **kwargs):
        self.request = kwargs.pop("request")              
        super(Award_Form, self).__init__(*args, **kwargs)
        self.fields['x'].required = False
        self.fields['y'].required = False
        self.fields['width'].required = False
        self.fields['height'].required = False





class Testimonial_Form(forms.ModelForm):
    class Meta:
        model = Testimonial
        fields = ['title','text_content','picture_content','video_content',]


    def __init__(self,*args,post_data=None, **kwargs):
        self.request = kwargs.pop("request")              
        super(Testimonial_Form, self).__init__(*args, **kwargs)


class Report_People_Form(forms.ModelForm):
    class Meta:
        model = Report_People
        fields = ['complaint','report_file']

    def __init__(self,*args,post_data=None, **kwargs):
        self.request = kwargs.pop("request")              
        super(Report_People_Form, self).__init__(*args, **kwargs)


class Company_Form(forms.ModelForm):
    started_date = forms.DateField(widget=forms.TextInput(attrs={'type': 'date'} ))
    
    class Meta:
        model = Company
        fields = ['name','location','address','mobile_no','started_date','logo']

    def __init__(self,*args,post_data=None, **kwargs):
        self.request = kwargs.pop("request")              
        super(Company_Form, self).__init__(*args, **kwargs)

        self.fields["location"].choices = [("", "Choose Location"),] + \
        list(self.fields["location"].choices)[1:]


class Social_Link_Form(forms.ModelForm):
    class Meta:
        model = User
        fields = ['instagram','twitter','facebook','youtube','website']

    def __init__(self,*args,post_data=None, **kwargs):
        self.request = kwargs.pop("request")              
        super(Social_Link_Form, self).__init__(*args, **kwargs)



class Join_Project_Form(forms.ModelForm):
    class Meta:
        model = Join_Project
        fields = ['project',]


    def __init__(self,*args, **kwargs):
        self.request = kwargs.pop("request")
        super(Join_Project_Form, self).__init__(*args, **kwargs)



class SetPasswordForm(forms.Form):
    """
    A form that lets a user change set their password without entering the old
    password
    """
    error_messages = {
        'password_mismatch':("The two password fields didn't match."),
    }
    new_password1 = forms.CharField(
        label=("New password"),
        widget=forms.PasswordInput,
        strip=False,
        help_text=password_validation.password_validators_help_text_html(),
    )
    new_password2 = forms.CharField(
        label=("New password confirmation"),
        strip=False,
        widget=forms.PasswordInput,
    )

    def __init__(self, user, *args, **kwargs):
        self.user = user
        super().__init__(*args, **kwargs)

    def clean_new_password2(self):
        password1 = self.cleaned_data.get('new_password1')
        password2 = self.cleaned_data.get('new_password2')
        if password1 and password2:
            if password1 != password2:
                raise forms.ValidationError(
                    self.error_messages['password_mismatch'],
                    code='password_mismatch',
                )
        password_validation.validate_password(password2, self.user)
        return password2

    def save(self, commit=True):
        password = self.cleaned_data["new_password1"]
        self.user.set_password(password)
        if commit:
            self.user.save()
        return self.user




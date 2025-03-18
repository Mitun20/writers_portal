
from django import forms
from .models import  Call, Pitch, Report
from account.models import Genre, Language


class Call_Form(forms.ModelForm):
    genre = forms.ModelMultipleChoiceField(widget=forms.CheckboxSelectMultiple, queryset=Genre.objects.all())
    expiry_date = forms.DateField(widget=forms.TextInput(attrs={'type': 'date'} ))
    language = forms.ModelMultipleChoiceField(widget=forms.CheckboxSelectMultiple, queryset=Language.objects.all())
    other_genre = forms.CharField(widget=forms.HiddenInput())
    other_language = forms.CharField(widget=forms.HiddenInput())


    class Meta:
        model = Call
        fields = ['call_for','genre','format','language','description','expiry_date','other_genre','other_language']

    def __init__(self,*args, **kwargs):
        self.request = kwargs.pop("request")
        super(Call_Form, self).__init__(*args, **kwargs)
        self.fields["call_for"].choices = [("", "Choose Call For"),] + \
            list(self.fields["call_for"].choices)[1:]
        self.fields["format"].choices = [("", "Choose Format"),] + \
            list(self.fields["format"].choices)[1:]
        self.fields['language'].widget.attrs['class'] = 'call-language'

        self.fields['genre'].widget.attrs['class'] = 'call_genre_option'
        self.fields['other_genre'].widget.attrs['placeholder'] = 'Specify if other genre'
        self.fields['other_language'].widget.attrs['placeholder'] = 'Specify if other language'
        self.fields['other_genre'].required = False
        self.fields['other_language'].required = False


class Pitch_Form(forms.ModelForm):
    x = forms.FloatField(widget=forms.HiddenInput())
    y = forms.FloatField(widget=forms.HiddenInput())
    width = forms.FloatField(widget=forms.HiddenInput())
    height = forms.FloatField(widget=forms.HiddenInput())
    genre = forms.ModelMultipleChoiceField(widget=forms.CheckboxSelectMultiple, queryset=Genre.objects.all())
    story_file = forms.FileField(widget=forms.FileInput(attrs={'accept':'application/pdf'}))
    other_genre = forms.CharField(widget=forms.HiddenInput())
    other_language = forms.CharField(widget=forms.HiddenInput())
    language = forms.ModelMultipleChoiceField(widget=forms.CheckboxSelectMultiple, queryset=Language.objects.all())
    class Meta:
        model = Pitch
        fields = ['story_title','story_file','genre','format','language','description','other_genre','other_language','cover_image','x','y','width', 'height']

    def __init__(self,*args, **kwargs):
        self.request = kwargs.pop("request")
        super(Pitch_Form, self).__init__(*args, **kwargs)
     
        self.fields["format"].choices = [("", "Choose Format"),] + \
            list(self.fields["format"].choices)[1:]
        self.fields['story_title'].widget.attrs['placeholder'] = 'Story Title'
        self.fields['story_file'].widget.attrs['class'] = 'form-control'
        self.fields['cover_image'].widget.attrs['class'] = 'form-control'
        self.fields['language'].widget.attrs['class'] = 'pitch-language'
        self.fields['genre'].widget.attrs['class'] = 'genre_option'
        self.fields['other_genre'].widget.attrs['placeholder'] = 'Specify if other genre'
        self.fields['other_language'].widget.attrs['placeholder'] = 'Specify if other language'
        self.fields['story_file'].required = False
        self.fields['other_genre'].required = False
        self.fields['x'].required = False
        self.fields['y'].required = False
        self.fields['width'].required = False
        self.fields['height'].required = False
        self.fields['description'].widget.attrs['maxlength'] = '200'
        self.fields['other_language'].required = False
        self.fields['story_file'].widget.attrs['accept'] = '.pdf,.doc,.jpg,.jpeg,.png,.docx,'





class Report_Form(forms.ModelForm):
 
    class Meta:
        model = Report
        fields = ['comment']

    def __init__(self,*args, **kwargs):
        self.request = kwargs.pop("request")
        super(Report_Form, self).__init__(*args, **kwargs)
from email.headerregistry import Address
from pydoc import describe
from django.db import models
from account.models import User, Language, Location
from .slugify import unique_slug_generator
from django.dispatch import receiver
from django.core.exceptions import ValidationError
# Create your models here.
priority_of_submission_options = (('S','Script'),('V','Video'))
subtitles_options = (('Y','Yes'),('N','No'))
gender_options = (('','Choose Gender'),('M','Male'),('F','Female'))


class Event(models.Model):
    title = models.CharField(max_length=256)
    slug = models.SlugField(max_length=200,unique=True,blank=True)
    open_date = models.DateField()
    close_date = models.DateField()
    created_on = models.DateTimeField(auto_now=True)
    description = models.TextField(null=True)


    def script_count(self):
        return Registration.objects.filter(event__id=self.id,priority_of_submission='S').count()

    def video_count(self):
        return Registration.objects.filter(event__id=self.id,priority_of_submission='V').count()

    def get_script(self):
        return Registration.objects.filter(event__id=self.id,priority_of_submission='S').distinct()

    def get_video(self):
        return Registration.objects.filter(event__id=self.id,priority_of_submission='V').distinct()


    def __str__(self):
        return self.title


class  Year_Of_Production(models.Model):
    year = models.CharField(max_length=4)


    def __str__(self):
        return self.year


class Registration(models.Model):
    user  = models.ForeignKey(User, on_delete=models.CASCADE)
    age =  models.PositiveIntegerField(null=True)
    profession = models.CharField(max_length=256,null=True)
    marital_status = models.CharField(max_length=256,null=True)
    experience_in_movie_industry = models.CharField(max_length=256,null=True)
    reference_if_any = models.CharField(max_length=256,null=True,blank=True)
    event = models.ForeignKey(Event, on_delete=models.CASCADE)
    film_title = models.CharField(max_length=256,null=True,blank=True)
    language = models.ForeignKey(Language, on_delete=models.CASCADE,null=True,blank=True)
    priority_of_submission = models.CharField(choices=priority_of_submission_options,max_length=1,default="S")
    synopsis  = models.CharField(max_length=100,null=True,blank=True)
    script = models.FileField(upload_to="events/scripts",blank=True)
    script_password =  models.CharField(max_length=256,blank=True)
    video_link = models.URLField(blank=True)
    video_password = models.CharField(max_length=256,blank=True)
    subtitles = models.CharField(choices=subtitles_options ,max_length=1,blank=True,null=True)
    film_duration = models.PositiveIntegerField(null=True,blank=True)
    year_of_production = models.ForeignKey(Year_Of_Production,on_delete=models.CASCADE,null=True,blank=True)
    your_role_of_production = models.CharField(max_length=256,null=True,blank=True)
    director = models.CharField(max_length=256,null=True,blank=True)
    cinematographer = models.CharField(max_length=256,null=True,blank=True)
    editor = models.CharField(max_length=256,null=True,blank=True)
    music_director = models.CharField(max_length=256,null=True,blank=True)
    writer = models.CharField(max_length=256,null=True,blank=True)
    cast = models.CharField(max_length=256,null=True,blank=True)

    instagram = models.CharField(max_length=100,null=True,blank=True)
    twitter = models.CharField(max_length=100,null=True,blank=True)
    facebook = models.CharField(max_length=100,null=True,blank=True)
    address =  models.TextField(null=True)
    city =  models.CharField(max_length=100,null=True)
    submitted_on = models.DateTimeField(auto_now_add=True,null=True)
    

    class Meta:
        ordering = ('-id', )




#To Create Slug
@receiver(models.signals.pre_save, sender=Event)
def auto_slug_generator(sender, instance, **kwargs):
    """
    Creates a slug if there is no slug.
    """
    if not instance.slug:
        instance.slug = unique_slug_generator(instance)






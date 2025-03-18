from django.db import models
from account.models import User, Location
# Create your models here.

status_options = (('R','Requested'),('A','Accepted'),('D','Declined'))
registration_status_options = (('R','Requested'),('A','Accepted'),('D','Declined'))

class Club_House(models.Model):
    name = models.CharField(max_length=150)
    admin = models.ForeignKey(User,on_delete=models.SET_NULL,null=True)
    created_on = models.DateField(auto_now=True)
    cover_photo = models.ImageField(upload_to="clubhouse_photo",blank=True)
    description = models.TextField()
    active = models.BooleanField(default=True)
    verified = models.BooleanField(default=False)

    def __str__(self):
        return self.name

class Club_House_Member(models.Model):
    club_house = models.ForeignKey(User,on_delete=models.CASCADE)
    member = models.ForeignKey(User,on_delete=models.CASCADE,related_name="member")
    status = models.CharField(choices=status_options,max_length=1) 
    join_date = models.DateField(auto_now=True)

class Event(models.Model):
    club_house = models.ForeignKey(Club_House,on_delete=models.CASCADE)
    title = models.CharField(max_length=150)
    description =  models.TextField()
    event_date = models.DateField() 
    location = models.ForeignKey(Location,on_delete=models.SET_NULL,null=True)
    venue = models.TextField()
    highlight = models.TextField()
    registration_close_date = models.DateField()
    poster_image = models.ImageField(upload_to="event_poster")
    created_on = models.DateTimeField(auto_now=True)

class Event_Registration(models.Model):
    event = models.ForeignKey(Club_House,on_delete=models.CASCADE)
    registered_by =  models.ForeignKey(User,on_delete=models.CASCADE)
    status = models.CharField(choices=registration_status_options,max_length=1)
    registered_on = models.DateTimeField(auto_now=True)



from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
from django.db import models
from django.core.mail import send_mail
from django.contrib.auth.models import PermissionsMixin
from django.contrib.auth.base_user import AbstractBaseUser
from django.db.models.fields import CharField
from django.utils.translation import gettext_lazy as _
from .managers import UserManager
from django.contrib.auth.models import Group
from django.core.exceptions import ValidationError
import datetime
from django.core.validators import MinValueValidator, MaxValueValidator
from django.db.models import Q, Count, F, Sum

from datetime import date
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from django.utils.html import strip_tags
from django.core.mail import EmailMessage
from django.core.mail import send_mail



gender_options = (('','Choose Gender'),('M','Male'),('F','Female'))
available_options = (('','Choose Availability'),('F','Full Time'),('P','Part Time'))
project_status_options = (('','Choose Status'),('C','Completed'),('P','Under production '),('U','Upcoming',))
visibility_options = (('','Choose Visibility'),('E','Visible to Everyone'),('F','Visible to Followers'),('N','Visible to Following'),('C','Visible to Followers/Following'),('I','Invisible'))

def my_year_validator(value):
    if value < 1900 or value > datetime.datetime.now().year:
        raise ValidationError(
            _('%(value)s is not a correcrt year!'),
            params={'value': value},
        )


class Location(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name

class Genre(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name

class Format(models.Model):
    name =  models.CharField(max_length=70)

    def __str__(self):
        return self.name

class Language(models.Model):
    language =  models.CharField(max_length=70)

    def __str__(self):
        return self.language

class Open_To(models.Model):
    name =  models.CharField(max_length=70)

    def __str__(self):
        return self.name


class User(AbstractBaseUser, PermissionsMixin):
    username = models.CharField(max_length=30, unique=True)
    email = models.EmailField(_('email address') )
    first_name = models.CharField(_('first name'), max_length=30, blank=True)
    last_name = models.CharField(_('last name'), max_length=30, blank=True)
    gender = models.CharField(choices=gender_options,max_length=1,blank=True)
    dob = models.DateField(blank=True,null=True)    
    no_of_filims_worked =  models.PositiveIntegerField(default=0)
    mobile_no=models.CharField(max_length=10,blank=True,null=True,unique=True)
    profile_photo=models.ImageField(blank=True,null=True,upload_to="profile_picture")
    location = models.ForeignKey(Location,on_delete=models.CASCADE,null=True,blank=True)
    available = models.CharField(choices=available_options,max_length=1,blank=True,null=True) 
    address=models.TextField(blank=True,null=True)
    registered_on=models.DateField(auto_now_add=True)
    is_active = models.BooleanField(_('active'), default=True) 
    is_staff=models.BooleanField(default=False)     
    groups=models.ManyToManyField(Group)

    specialization_of_genre =  models.ManyToManyField(Genre,blank=True)
    other_genre = models.CharField(max_length=100,null=True,blank=True)
    interested_format = models.ManyToManyField(Format,blank=True)
    open_to = models.ManyToManyField(Open_To,blank=True)
    languages_to_work = models.ManyToManyField(Language,blank=True)
    other_language = models.CharField(max_length=100,null=True,blank=True)
    
    make_mobile_no_visible = models.CharField(choices=visibility_options,max_length=1,blank=True,null=True)
    make_address_visible = models.CharField(choices=visibility_options,max_length=1,blank=True,null=True)
    
    instagram = models.URLField(max_length=100,null=True,blank=True)
    twitter = models.URLField(max_length=100,null=True,blank=True)
    facebook = models.URLField(max_length=100,null=True,blank=True)
    youtube = models.URLField(max_length=100,null=True,blank=True)
    website = models.URLField(max_length=100,null=True,blank=True)

    get_notification = models.BooleanField( default=True) 

    verified_email = models.BooleanField(default=False)  
    admin_approval = models.BooleanField(default=False)    

    objects = UserManager()

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = []

    class Meta:
        verbose_name = _('user')
        verbose_name_plural = _('users')
    

    def report_count(self):
        count = Report_People.objects.filter(reported_user=self,is_active=True).count()
        return count

    @property
    def get_full_name(self):
        '''
        Returns the first_name plus the last_name, with a space in between.
        '''
        full_name = '%s %s' % (self.first_name, self.last_name)
        return full_name.strip()

    def get_short_name(self):
        '''
        Returns the short name for the user.
        '''
        return self.first_name

    def email_user(self, subject, message, from_email=None, **kwargs):
        '''
        Sends an email to this User.
        '''
        send_mail(subject, message, from_email, [self.email], **kwargs)

    def get_story_count(self):
        return self.pitch_owner.filter(post__active=True).count()

    def get_call_count(self):
        return self.call_owner.filter(post__active=True).count()

    def following_count(self):
        count= UserFollowing.objects.filter(user=self.id).count()
        return str(count)

    def followers_count(self):
        count= UserFollowing.objects.filter(following_user_id=self.id).count()
        return str(count)


    def __str__(self):
        if self.first_name and self.last_name:
            return '%s %s' % (self.first_name, self.last_name)
        if self.first_name and not self.last_name:
            return self.first_name        
        elif self.last_name and not self.first_name:
            return self.name
        elif not self.first_name and not self.last_name:
            return self.username
        else:
            return self.username

    def active_or_inactive(user,info):
        email = user.email
        mail_subject = 'Screen Writers Account -  Reg.'
        message = render_to_string('mail/user_active_inactive.html', {
            'info': info,       
         
        })
        plain_message = strip_tags(message)
        to_email = email
        from_email = "Screen Writers"
        send_mail(mail_subject,plain_message,from_email,[to_email,],html_message=message,)


        if user.is_active:
            user.is_active = False
            user.save()
            return False
        else:
            user.is_active = True
            user.save()
            return True


    #Portal Admin

    @staticmethod
    def portal_admin_filter(filter_type):
        if filter_type == "recent":
            users = User.objects.filter(groups__name__in=('Producer','Writer','Director')).distinct().order_by('-id')[:20]
        elif filter_type == "most_active":
            users =  User.objects.filter(Q(call_owner__isnull=False) | Q(pitch_owner__isnull=False)).annotate(total=Sum(F('call_owner__id') + F('pitch_owner__id'))).order_by('-total') 
            
        elif filter_type == "most_responded":
            users = User.objects.filter(interest__shown_by__isnull=False).annotate(top=Count('interest__shown_by__id')).order_by('-top')
        elif filter_type == "reported":
            users = User.objects.filter(reports__is_active=True).annotate(top=Count('reports__id')).distinct().order_by('-top')
        elif filter_type == "activepeople":
            users = User.objects.filter(is_active=True,groups__name__in=('Producer','Writer','Director')).distinct().order_by('-id')

        elif filter_type == "pendingapproval":
            users = User.objects.filter(admin_approval=False,groups__name__in=('Producer','Writer','Director')).distinct().order_by('-id')

        return users

    def profile_completion_check(user_id):
        if User.objects.filter(id=user_id,specialization_of_genre__isnull=False).exists():
            return True
        else:
            return False


class Project(models.Model):
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)
    title = models.CharField(max_length=300)
    year  = models.PositiveIntegerField(validators=[my_year_validator],default=date.today().year)
    genre = models.ManyToManyField(Genre)
    release_date = models.DateField(null=True,blank=True)
    language = models.ManyToManyField(Language)
    budget = models.FloatField(blank=True,null=True)    
    imdb_link =  models.URLField(max_length=200,blank=True)
    image = models.ImageField(upload_to="project_image",null=True,blank=True)
    description = models.TextField(null=True)
    status = models.CharField(choices=project_status_options,max_length=1,blank=True,null=True,) 
    
    def __str__(self):
        return self.title

    def description_count(self):
        return len(self.description)

    class Meta:
        ordering = ('-id', )

class Join_Project(models.Model):
    project = models.ForeignKey(Project, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)




class Qualification(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    degree = models.CharField(max_length=100)
    institute = models.CharField(max_length=250)
    year = models.PositiveIntegerField(validators=[my_year_validator])

    def __str__(self):
        return '%s - %s - %s' % (self.degree, self.institute, self.year)


class Assistant(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE,null=True)
    senior = models.CharField(max_length=100,blank=True)
    senior_link  = models.ForeignKey(User, on_delete=models.CASCADE ,blank=True,null=True,related_name="senior")
    project = models.ForeignKey(Project, on_delete=models.CASCADE)
    year = models.PositiveIntegerField(validators=[my_year_validator],null=True,blank=True)


class Award(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    title = models.CharField(max_length=300)
    year = models.PositiveIntegerField(validators=[my_year_validator])
    banner = models.CharField(max_length=100)
    image = models.ImageField(upload_to="awards")
    project = models.ForeignKey(Project, on_delete=models.CASCADE)


    def __str__(self):
        return '%s - %s' % (self.title, self.year)


class Highlight(models.Model):
    project = models.ForeignKey(Project,on_delete=models.CASCADE,null=True,related_name="highlights")  
    title = models.CharField(max_length=150,null=True)
    content = models.TextField(null=True)  

    def __str__(self):
        return self.title

    class Meta:
        ordering = ('-id',)




class Testimonial(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    title = models.CharField(max_length=300)
    person = models.ForeignKey(User, on_delete=models.CASCADE,related_name="person")
    text_content  = models.TextField(blank=True)
    picture_content = models.ImageField(upload_to="testimonial_picture_content",blank=True)
    video_content = models.URLField(max_length=200,blank=True)
    project = models.ForeignKey(Project,on_delete=models.CASCADE,blank=True,null=True)


    def __str__(self):
        return self.title



class UserFollowing(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    following_user = models.ForeignKey(User,on_delete=models.CASCADE, related_name="following")
    created = models.DateTimeField(auto_now_add=True)


    def __str__(self):
        return str(self.user)

    def follow_or_unfollow(user,following_user_id):
        if UserFollowing.objects.filter(user=user,following_user=following_user_id).exists():
            UserFollowing.objects.get(user=user,following_user=following_user_id).delete()
            return False
        else:
            UserFollowing.objects.create(user=user,following_user=following_user_id)
            return True

    


class Report_People(models.Model):
    reported_by = models.ForeignKey(User,on_delete=models.CASCADE,related_name="reported_by")
    reported_user = models.ForeignKey(User,on_delete=models.CASCADE,related_name="reports")
    reported_on = models.DateField(auto_now=True)
    complaint = models.TextField(blank=True)
    report_file = models.FileField(upload_to="report file",blank=True)
    is_active = models.BooleanField(default=True)

    def delete(id):
        Report_People.objects.filter(id=id).delete()    
        return True

    def skip_all_reports(user):
        Report_People.objects.filter(reported_user__id=user).update(is_active=False)
        return True

    class Meta:
        ordering = ['-id']
   
class Company(models.Model):
    name = models.CharField(max_length=150)
    location = models.ForeignKey(Location,on_delete=models.CASCADE)
    address=models.TextField()
    mobile_no=models.CharField(max_length=10)
    started_date=models.DateField()
    owner = models.OneToOneField(User,on_delete=models.CASCADE,related_name="company")
    logo = models.ImageField(upload_to="Company Logo")
    
    def __str__(self):
        return self.name



class Rating(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    rated_by = models.ForeignKey(User, on_delete=models.CASCADE,related_name="rated_by")
    stars = models.IntegerField(validators=[MinValueValidator(1),MaxValueValidator(5)])


class Conversation(models.Model):
    sender = models.ForeignKey(User, on_delete=models.CASCADE)
    receiver = models.ForeignKey(User, on_delete=models.CASCADE,related_name="receiver")
    date = models.DateTimeField(auto_now=True)


class Chat(models.Model):
    conversation =  models.ForeignKey(Conversation, on_delete=models.CASCADE,null=True)
    sender = models.ForeignKey(User, on_delete=models.CASCADE)
    date = models.DateTimeField(auto_now=True)
    message = models.TextField()
    unread = models.BooleanField(default=True)
    m_file = models.FileField(upload_to="message_file",null=True,blank=True)

    def save(self, receiver, force_insert=False, force_update=False):
        try:
            conversation =  Conversation.objects.get(Q(sender=self.sender,receiver=receiver) | Q(sender=receiver,receiver=self.sender))
        except:
            conversation,created= Conversation.objects.get_or_create(sender=self.sender,receiver=receiver)

        if receiver.get_notification: 
            current_time =  datetime.datetime.now()
            today_date = current_time.day            
            if not Chat.objects.filter(conversation=conversation,sender=self.sender,date__day=today_date,date__hour__gt=current_time.hour-1).exists():          
                mail_subject = 'You got a message from ' + str(self.sender) 
                
                message = render_to_string('mail/inbox.html', {
                        'sender': self.sender,
                        'message' : self.message,
                    
                })
                plain_message = strip_tags(message)
                to_email = receiver.email
                from_email='Screen Writers'
                send_mail(mail_subject,plain_message,from_email,[to_email,],html_message=message,)
                

            inbox_count = Chat.unread_count(receiver)
            if inbox_count > 100  or inbox_count == 150 or inbox_count == 200 or inbox_count == 300:

                mail_subject = str(inbox_count) + ' unread message'            
                message = render_to_string('mail/inbox_100_unread_message.html', {
                        'user' : receiver,
                        'count': inbox_count,
                    
                })
                plain_message = strip_tags(message)
                to_email = receiver.email
                from_email='Screen Writers'
                send_mail(mail_subject,plain_message,from_email,[to_email,],html_message=message,)
                


        self.conversation = conversation
        conversation.date=datetime.datetime.now()
        conversation.save()

        super(Chat, self).save(force_insert, force_update)
        
    @staticmethod    
    def unread_count(user):
        count = Chat.objects.filter(Q(conversation__sender=user,unread=True)|Q(conversation__receiver=user,unread=True)).exclude(sender=user).count()
        return count

    @staticmethod    
    def readed_count(user):
        count = Chat.objects.filter(Q(conversation__sender=user,unread=False)|Q(conversation__receiver=user,unread=False)).exclude(sender=user).count()
        return count




class Blocked_User(models.Model):
    blocked_by = models.ForeignKey(User, on_delete=models.CASCADE,related_name="blocked_by")
    blocked_user = models.ForeignKey(User, on_delete=models.CASCADE,related_name='blocked_user')


    def block_unblock(user,blocked_user):
        if Blocked_User.objects.filter(blocked_by=user,blocked_user=blocked_user).exists():
            Blocked_User.objects.get(blocked_by=user,blocked_user=blocked_user).delete()
            return False
        else:
            Blocked_User.objects.create(blocked_by=user,blocked_user=blocked_user)
            return True

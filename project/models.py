from django.db import models
from account.models import User, Open_To, Project,Location, Genre, Format, Language, Award, Assistant
import datetime
from django.db.models import Count, Q
from django.core.mail import send_mail
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from django.utils.html import strip_tags
from django.core.exceptions import ValidationError
# Create your models here.

category_options = (('P','Project'),('A','Award'),('S','As Assistant'),('C','Calls'),('T', 'Pitch'))

def my_year_validator(value):
    if value < 1900 or value > datetime.datetime.now().year:
        raise ValidationError(
            _('%(value)s is not a correcrt year!'),
            params={'value': value},
        )


#pitch file upload size validation
def validate_file_size(value):
    filesize= value.size
    
    if filesize > 10485760:
        raise ValidationError("The maximum file size that can be uploaded is 10MB")
    else:
        return value


class RecentPostManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset().filter(active=True).order_by('-date')

class Active_RecentPostManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset().filter(active=True).order_by('-date')

class OppurtunityPostManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset().filter(active=True,post_category='C').order_by('-date')

class TalentPostManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset().filter(active=True,post_category='T').order_by('-date')

class WallPostManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset().filter(post_category__in=('C','T'))

class InterestPostManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset().filter(post_category__in=('C','T')).exclude(interest__isnull=True)

class NoInterestPostManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset().filter(post_category__in=('C','T'),interest__isnull=True)


class RecentMonthPopular(models.Manager):
    def get_queryset(self):
        today = datetime.date.today()
        ninty_days_ago = today - datetime.timedelta(days=90)
        return super().get_queryset().filter(date__gte=ninty_days_ago).annotate(top=Count('upvotes')).order_by('-top')

class RecentMonthPopularForWriter(models.Manager):
    def get_queryset(self):
        today = datetime.date.today()
        ninty_days_ago = today - datetime.timedelta(days=90)
        return super().get_queryset().filter(date__gte=ninty_days_ago).annotate(top=Count('like__id')).order_by('-top').exclude(post_category="T") [0:10]



class RecentWeekPopular(models.Manager):
    def get_queryset(self):
        today = datetime.date.today()
        seven_days_ago = today - datetime.timedelta(days=7)
        return super().get_queryset().filter(date__gte=seven_days_ago).annotate(top=Count('like__id')).order_by('-top') [0:10]


class Call(models.Model):
    call_for = models.ForeignKey(Open_To,on_delete=models.CASCADE)
    title = models.CharField(max_length=255,blank=True)
    genre = models.ManyToManyField(Genre)
    other_genre = models.CharField(null=True,blank=True,max_length=50)
    format = models.ForeignKey(Format,on_delete=models.SET_NULL,null=True,verbose_name="Content Format")
    language = models.ManyToManyField(Language)
    other_language =  models.CharField(null=True,blank=True,max_length=100)
    description = models.TextField(null=True,blank=True)
    budget = models.FloatField(null=True,blank=True)
    owner = models.ForeignKey(User,on_delete=models.CASCADE,related_name="call_owner")
    expiry_date = models.DateField(null=True)

    def __str__(self):
        return "call for " + str(self.call_for)

    def description_count(self):
        return len(self.description)


class Pitch(models.Model):
    story_title = models.CharField(max_length=255)
    story_file = models.FileField(upload_to="stories",null=True,blank=True, validators=[validate_file_size])
    genre = models.ManyToManyField(Genre)
    other_genre = models.CharField(null=True,blank=True,max_length=50)
    format = models.ForeignKey(Format,on_delete=models.SET_NULL,null=True,verbose_name="Content Format")
    language = models.ManyToManyField(Language)
    other_language =  models.CharField(null=True,blank=True,max_length=100)
    description = models.TextField(null=True,blank=True)
    budget = models.FloatField(null=True,blank=True)
    owner = models.ForeignKey(User,on_delete=models.CASCADE,related_name="pitch_owner")
    pitch_to_people = models.ManyToManyField(User,related_name='to_user',null=True,blank=True)
    cover_image = models.ImageField(blank=True,null=True,upload_to="pitch_cover")

    def __str__(self):
        return self.story_title

    def description_count(self):
        return len(self.description)

class Post(models.Model):
    post_title = models.CharField(max_length=255,blank=True)
    post_category = models.CharField(choices=category_options, max_length=1)
    date = models.DateTimeField(auto_now=True)
    award = models.OneToOneField(Award,on_delete=models.CASCADE,null=True,blank=True)
    project = models.OneToOneField(Project,on_delete=models.CASCADE,null=True,blank=True)
    assistant = models.OneToOneField(Assistant,on_delete=models.CASCADE,null=True,blank=True)
    pitch = models.OneToOneField(Pitch,on_delete=models.CASCADE,null=True,blank=True)
    call = models.OneToOneField(Call,on_delete=models.CASCADE,null=True,blank=True)
    active = models.BooleanField(default=True)
    cannot_open = models.BooleanField(default=False)
    objects = models.Manager()
    recentposts = RecentPostManager()
    activerecentposts = Active_RecentPostManager()
    oposts = OppurtunityPostManager()
    tposts = TalentPostManager()
    interestposts = InterestPostManager()
    nointerestposts = NoInterestPostManager()
    wallposts = WallPostManager()
    monthpopular = RecentMonthPopular()
    monthpopular = RecentMonthPopular()
    weekpopular = RecentWeekPopular()

    def __str__(self):
        return self.post_title

    def get_owner(self):
        if self.post_category == 'P':
            return self.project.created_by.first_name
        elif self.post_category == 'A':
            return self.award.user.first_name
        elif self.post_category == 'S':
            return self.assistant.user.first_name
        elif self.post_category == 'C':
            return self.call.owner.first_name
        else:
            return self.pitch.owner.first_name

    def posted_by(self):
        if self.post_category == 'P':
            return self.project.created_by
        elif self.post_category == 'A':
            return self.award.user
        elif self.post_category == 'S':
            return self.assistant.user
        elif self.post_category == 'C':
            return self.call.owner
        else:
            return self.pitch.owner

    def check_unread_message(self):
        return None

    

    def like_or_unlike(self,user):
        if Like.objects.filter(post=self,liked_by=user).exists():
            Like.objects.get(post=self,liked_by=user).delete()
            return False
        else:
            Like.objects.create(post=self,liked_by=user)
            return True
            
    def upvote_or_downvote(self,user,action):
        if action == "upvote":
            if Downvote.objects.filter(post=self,downvoted_by=user).exists():
                downvote = Downvote.objects.get(post=self,downvoted_by=user)
                downvote.delete()

            if  Upvote.objects.filter(post=self,upvoted_by=user).exists():
                    upvote = Upvote.objects.get(post=self,upvoted_by=user)
                    upvote.delete()
                    return 'dis-upvoted'

            else:              
                Upvote.objects.create(post=self,upvoted_by=user)
                return 'upvoted'


        elif action == "downvote":
            if  Upvote.objects.filter(post=self,upvoted_by=user).exists():
                upvote = Upvote.objects.get(post=self,upvoted_by=user)
                upvote.delete()


            if  Downvote.objects.filter(post=self,downvoted_by=user).exists():
                downvote = Downvote.objects.get(post=self,downvoted_by=user)
                downvote.delete()
                return 'dis-downvoted'

            else:
                Downvote.objects.create(post=self,downvoted_by=user)
                return 'downvoted'
    
  



    def active_or_close(self):
        if Post.objects.filter(active=True).exists():
            Post.objects.filter(id=self.id).update(active=False)
            return False
        else:
            Post.objects.filter(id=self.id).update(active=True)
            return True

    def open_close(post,report):
        report = report
        if post.cannot_open:
            post.cannot_open = False
            post.active = True
            post.save()


            mail_subject ='Portal Admin  has unblocked your post ' + str(post.post_title)
    
            message = render_to_string('mail/post_block_unblock.html', {
                'blocked': False,
                'post':post,  
                'report':report,             
        
            })
            plain_message = strip_tags(message)
            to_email = post.posted_by().email
            from_email='Screen Writers'
            send_mail(mail_subject,plain_message,from_email,[to_email,],html_message=message,)

            return False

        else:
            post.cannot_open = True
            post.active = False
            post.save()
            mail_subject ='Portal Admin  has blocked your post ' + str(post.post_title)    
            message = render_to_string('mail/post_block_unblock.html', {
                'blocked': True,
                'post':post, 
                'report':report,              
        
            })
            plain_message = strip_tags(message)
            to_email = post.posted_by().email
            from_email='Screen Writers'

            send_mail(mail_subject,plain_message,from_email,[to_email,],html_message=message,)
            return True


    @property
    def get_like_count(self):
        return Like.objects.filter(post=self).count()

    def get_upvote_count(self):
        return Upvote.objects.filter(post=self).count()

    def get_downvote_count(self):
        return Downvote.objects.filter(post=self).count()

    def get_interest_count(self):
        return Interest.objects.filter(post=self).count()

    def get_report_count(self):
        return Report.objects.filter(post=self,is_active=True).count()


    @property
    def get_comment_count(self):
        return Comment.objects.filter(post=self).count()

    #portal admin
    @staticmethod
    def portal_admin_filter(filter_type):
        posts = None
        if filter_type == "recent":
            posts = Post.objects.filter(Q(call__isnull=False,call__expiry_date__gte=datetime.date.today()) |Q(pitch__isnull=False) ).order_by('-date')[:20]
        elif filter_type == "most_liked":
           posts = Post.objects.filter(Q(call__isnull=False,call__expiry_date__gte=datetime.date.today()) | Q(pitch__isnull=False),upvote__isnull=False).annotate(top=Count('upvote__id')).order_by('-top')
            
        elif filter_type == "most_responded":
            posts = Post.objects.filter(Q(call__isnull=False,call__expiry_date__gte=datetime.date.today()) |Q(pitch__isnull=False),interest__isnull=False).annotate(top=Count('interest__id')).order_by('-top')
        elif filter_type == "reported":
            posts = Post.objects.filter(Q(call__isnull=False,call__expiry_date__gte=datetime.date.today()) |Q(pitch__isnull=False),reports__is_active=True).annotate(top=Count('reports__id')).order_by('-top')

        return posts
        
class Like(models.Model): 
    post = models.ForeignKey(Post,on_delete=models.CASCADE)
    liked_by = models.ForeignKey(User,on_delete=models.CASCADE)


class Upvote(models.Model): 
    post = models.ForeignKey(Post,on_delete=models.CASCADE)
    upvoted_by = models.ForeignKey(User,on_delete=models.CASCADE)


class Downvote(models.Model): 
    post = models.ForeignKey(Post,on_delete=models.CASCADE)
    downvoted_by = models.ForeignKey(User,on_delete=models.CASCADE)

 



class Comment(models.Model):
    post = models.ForeignKey(Post,on_delete=models.CASCADE)
    commented_by = models.ForeignKey(User,on_delete=models.CASCADE)
    comment = models.TextField()
    date = models.DateField(auto_now=True)

class Report(models.Model):
    post = models.ForeignKey(Post,on_delete=models.CASCADE,related_name="reports")
    reported_by = models.ForeignKey(User,on_delete=models.CASCADE)
    comment = models.TextField()
    date = models.DateField(auto_now=True)
    is_active = models.BooleanField(default=True)


    def delete(id):
        Report.objects.filter(id=id).delete()    
        return True

    def skip_all_reports(post):
        Report.objects.filter(post__id=post).update(is_active=False)
        return True

    class Meta:
        ordering = ['-id']

class Interest(models.Model):
    post = models.ForeignKey(Post,on_delete=models.CASCADE)
    shown_by = models.ForeignKey(User,on_delete=models.CASCADE)

class Message(models.Model):
    interest = models.ForeignKey(Interest,on_delete=models.CASCADE,null=True,blank=True)
    message_by = models.ForeignKey(User,on_delete=models.CASCADE)
    message_to = models.ForeignKey(User,on_delete=models.CASCADE,related_name="message_to",null=True)
    date = models.DateTimeField(auto_now=True)
    message = models.TextField()
    unread = models.BooleanField(default=True)
    m_file = models.FileField(upload_to="message_file",null=True,blank=True)


    def save(self, post_id,shown_by,msg_type,message_by, force_insert=False, force_update=False):

        if msg_type == "interest":
            post= Post.objects.get(id=post_id)
            owner = post.posted_by()
            interest,created= Interest.objects.get_or_create(post=post,shown_by=shown_by)
            self.interest = interest
            if owner.get_notification:
                if created:
                    self.message_to = owner
                    self.interest = interest

                    mail_subject = str(shown_by) + ' has responded your post ' + str(post.post_title)
            
                    message = render_to_string('mail/interest.html', {
                        'shown_by': shown_by,
                        'post' : post,
                
                    })
                    plain_message = strip_tags(message)
                    to_email = owner.email
                    from_email='Screen Writers'

                    send_mail(mail_subject,plain_message,from_email,[to_email,],html_message=message,)


                elif owner == message_by:
                    current_time =  datetime.datetime.now()
                    today_date= current_time.day
                    
                    if not Message.objects.filter(interest=interest,message_by=owner,date__day=today_date,date__hour__gt=current_time.hour-1).exists():          
                        mail_subject = str(owner) + ' has responded your interest ' + str(post.post_title)
                        
                        message = render_to_string('mail/interest_message.html', {
                                'sender': owner,
                                'message' : self.message,
                                'post' :post,
                            
                        })
                        plain_message = strip_tags(message)
                        to_email = interest.shown_by.email
                        from_email='Screen Writers'
                        send_mail(mail_subject,plain_message,from_email,[to_email,],html_message=message,)
                    

                        inbox_count = Message.unread_count(shown_by)
                        if inbox_count > 100  or inbox_count == 150 or inbox_count == 200 or inbox_count == 300:

                            mail_subject = str(inbox_count) + ' unread message'            
                            message = render_to_string('mail/interest_100_unread_message.html', {
                                    'user' : owner,
                                    'count': inbox_count,
                                
                            })
                            plain_message = strip_tags(message)
                            to_email = receiver.email
                            from_email='Screen Writers'
                            send_mail(mail_subject,plain_message,from_email,[to_email,],html_message=message,)
                            

                    self.message_to = shown_by
            


                else:
                    self.message_to = owner

                    current_time =  datetime.datetime.now()
                    today_date= current_time.day
                    
                    if not Message.objects.filter(interest=interest,message_by=interest.shown_by,date__day=today_date,date__hour__gt=current_time.hour-1).exists():          
                        mail_subject = str(owner) + ' has responded your call ' + str(post.post_title)
                        
                        message = render_to_string('mail/interest_message.html', {
                                'sender': interest.shown_by,
                                'message' : self.message,
                                'post'  :post,
                            
                        })
                        plain_message = strip_tags(message)
                        to_email = interest.shown_by.email
                        from_email='Screen Writers'
                        send_mail(mail_subject,plain_message,from_email,[to_email,],html_message=message,)
                    
        
                        inbox_count = Message.unread_count(owner)
                        if inbox_count > 100  or inbox_count == 150 or inbox_count == 200 or inbox_count == 300:

                            mail_subject = str(inbox_count) + ' unread message'            
                            message = render_to_string('mail/interest_100_unread_message.html', {
                                    'user' : interest.shown_by,
                                    'count': inbox_count,
                                
                            })
                            plain_message = strip_tags(message)
                            to_email = receiver.email
                            send_mail(mail_subject,plain_message,'madhanjaji@gmail.com',[to_email,],html_message=message,)
                         

        elif msg_type == "normal_msg":
            pass
        super(Message, self).save(force_insert, force_update)

    @staticmethod
    def unread_count(user):
        pitch_count = Message.objects.exclude(interest__post__post_category__in=('C','P','A','S')).filter((Q(interest__post__pitch__owner=user) | Q(interest__shown_by=user) ),~Q(message_by=user),unread=True).count()
        call_count = Message.objects.exclude(interest__post__post_category__in=('T','P','A','S')).filter((Q(interest__post__call__owner=user) | Q(interest__shown_by=user) ),~Q(message_by=user),unread=True).count()
        return pitch_count + call_count


    @staticmethod
    def inbox_count(user):
        count = Message.objects.filter(message_to=user,unread=True).count()        
        return count
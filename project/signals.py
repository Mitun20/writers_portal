from django.db.models.signals import post_save, pre_delete
from django.contrib.auth.models import User
from django.dispatch import receiver
from .models import Pitch, Call, Post
from account.models import Award, Project, Assistant
  
  
@receiver(post_save, sender=Call) 
def create_call_post(sender, instance, created, **kwargs):
    post_title = str(instance.owner.first_name) + "'s " + "Call for " + str(instance.call_for) 
    if created:
        Post.objects.create(post_title=post_title,post_category='C',call=instance)
    else:
        instance.post.post_title = post_title
        instance.post.save()
   
@receiver(post_save, sender=Call) 
def save_call_post(sender, instance, **kwargs):
    
    instance.post.save()


@receiver(post_save, sender=Pitch) 
def create_pitch_post(sender, instance, created, **kwargs):
    post_title = "Read my story synopsis of " + str(instance.story_title) 
    if created:
        Post.objects.create(post_title=post_title,post_category='T',pitch=instance)
    else:
        instance.post.post_title = post_title
        instance.post.save()
   
@receiver(post_save, sender=Pitch) 
def save_pitch_post(sender, instance, **kwargs):
    
    instance.post.save()


@receiver(post_save, sender=Project) 
def create_project_post(sender, instance, created, **kwargs):
    post_title = str(instance.created_by.first_name) +  " Worked in " + str(instance.title) 
    if created:
        Post.objects.create(post_title=post_title,post_category='P',project=instance)
    else:
        instance.post.post_title = post_title
        instance.post.save()
   
@receiver(post_save, sender=Project) 
def save_project_post(sender, instance, **kwargs):
    
    instance.post.save()


@receiver(post_save, sender=Assistant) 
def create_assistant_post(sender, instance, created, **kwargs):
    post_title = str(instance.user.first_name) +  " Worked as Assistant Director in " + str(instance.project.title) 
    if created:
        Post.objects.create(post_title=post_title,post_category='S',assistant=instance)
    else:
        instance.post.post_title = post_title
        instance.post.save()
   
@receiver(post_save, sender=Assistant) 
def save_assistant_post(sender, instance, **kwargs):
    
    instance.post.save()


@receiver(post_save, sender=Award) 
def create_award_post(sender, instance, created, **kwargs):
    post_title = str(instance.user.first_name) + " Recieved the Award " + str(instance.title) 
    if created:
        Post.objects.create(post_title=post_title,post_category='A',award=instance)
    else:
        instance.post.post_title = post_title
        instance.post.save()
   
@receiver(post_save, sender=Award) 
def save_award_post(sender, instance, **kwargs):
    
    instance.post.save()
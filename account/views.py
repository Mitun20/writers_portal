from multiprocessing import Event
from typing import Dict
from django.shortcuts import redirect, render

from portal_admin.views import event
from .forms import Signup_Form, CustomAuthForm,Edit_Profile_Form, Assistant_Form, Highlight_Form,Qualification_Form, Award_Form, Project_Form, Testimonial_Form, Report_People_Form,Company_Form,Social_Link_Form, SetPasswordForm
from django.core.mail import EmailMessage
from .tokens import account_activation_token
from django.contrib.sites.shortcuts import get_current_site
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes, force_str
from django.template.loader import render_to_string
from .models import User, Assistant, Qualification, Award, UserFollowing, Highlight, Genre, Format, Language, Open_To, Company, Rating, Testimonial, Chat,Conversation,Blocked_User, Join_Project
from django.contrib.auth.views import LoginView
from django.contrib.auth.decorators import login_required
from django.http import  JsonResponse
from django.db.models import Q, Avg
from project.models import Project, Message
from django.contrib.auth.models import Group
from django.contrib.auth import logout as user_logout
from PIL import Image
from django.core.files.base import ContentFile
from django.db.models import Avg, Max, Min, F
import ast
from django.views.decorators.csrf import csrf_exempt
import random
import datetime
from datetime import datetime as df
import urllib.request
import urllib.parse
import requests
from django.contrib.auth.forms import PasswordChangeForm 
from django.contrib import messages
from django.contrib.auth import  update_session_auth_hash
from event.models import Registration
# Create your views here.


def signup(request):

    if request.method == "POST":
        data = dict()
        form = Signup_Form (request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.username=int(form.cleaned_data['mobile_no'])
            user.is_active = False
            user.save()    
            groups = form.cleaned_data['groups']

            for group in groups:
                user.groups.add(group)  
            

            '''

            current_site = get_current_site(request)
            mail_subject = 'Activate your account.'
            message = render_to_string('registration/account_active_email.html', {
                'user': user,
                'domain': current_site.domain,
                'uid': force_str(urlsafe_base64_encode(force_bytes(user.pk))),
                'token':account_activation_token.make_token(user),
            })
            to_email = form.cleaned_data.get('email')
            email = EmailMessage(
                        mail_subject, message,from_email="Screen Writers", to=[to_email]
            )
            email.send()
            '''
            #remove old session 
            if "mobile_verified" in request.session.keys():
                del request.session["mobile_verified"]
            if "mobile_no" in request.session.keys():
                del request.session["mobile_no"]

            if "random_otp" in request.session.keys():
                del request.session["random_otp"]

            if "otp_generated_at" in request.session.keys():
                del request.session["otp_generated_at"] 


            data['valid'] = True
            return redirect('/registered-successfully/')

        else:         
            return render(request,'registration/signup.html',{'form':form,})
    else:       
        form = Signup_Form()

    context = {
            'form':form,
           }
    return render(request,'registration/signup.html',context)



def registered(request):
    return render(request,'registration/registered.html')


def activate_account(request, uidb64, token):
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except(TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None
    if user is not None and account_activation_token.check_token(user, token):
        user.verified_email = True
        user.save()

        return render(request,'registration/email_verified.html')
        
    else:
        return render(request,'registration/invalid_activate_link.html')

class CustomLoginView(LoginView):
    authentication_form = CustomAuthForm
    redirect_authenticated_user = True

@login_required(login_url='/signin/')
def edit_profile(request):

    unread_message_count = Message.unread_count(request.user)
    inbox_count = Chat.unread_count(request.user)

    if request.method == "POST":
        form = Edit_Profile_Form(request.POST, request.FILES,instance=request.user)
        if form.is_valid():    
            form.save() 
            return redirect('/my_profile/')
        else:
            return render(request,'account/edit_profile.html', {'form': form,'unread_message_count':unread_message_count,'inbox_count':inbox_count})
    else:
        form = Edit_Profile_Form(instance=request.user)              
    return render(request,'account/edit_profile.html', {'form': form,'unread_message_count':unread_message_count,'inbox_count':inbox_count})


@login_required(login_url='/signin/')
def my_profile(request):
    user = request.user
    unread_message_count = Message.unread_count(request.user) 
    project_form = Project_Form(request=request)
    inbox_count = Chat.unread_count(request.user)
    joined_projects = Join_Project.objects.filter(user=request.user).values_list('project__id',flat=True)

    projects = Project.objects.filter(created_by=request.user).exclude(id__in=joined_projects).order_by('-id')[:5]
    events = Registration.objects.filter(user=request.user)

    is_writer = False
    is_producer = False
    is_director = False
 
    for group in request.user.groups.all():
        if group.name  == "Writer":
            is_writer = True
        elif group.name  == "Producer":
            is_producer = True
        elif group.name  == "Director":
            is_director = True
        elif group.name == "Admin":
            is_admin = True

    
    try:
        company = Company.objects.get(owner=user)
    except:
        company = None

    return render(request,'account/profile.html',{'events':events ,'projects':projects,'is_writer':is_writer,'is_producer':is_producer,'is_director':is_director,'inbox_count':inbox_count,'project_form':project_form,'company':company,'unread_message_count':unread_message_count,} )


def profile(request,pk):
    is_writer = False
    is_producer = False
    is_director = False
    is_admin = False

    user_object_is_writer = False
    unread_message_count  = Message.unread_count(request.user)
    inbox_count = Chat.unread_count(request.user) 
    project_form = Project_Form(request=request)
    for group in request.user.groups.all():
        if group.name  == "Writer":
            is_writer = True
        elif group.name  == "Producer":
            is_producer = True
        elif group.name  == "Director":
            is_director = True
        elif group.name == "Admin":
            is_admin = True
    

    user_object = User.objects.get(id=pk)
    if user_object.groups.filter(name='Writer').exists():
        user_object_is_writer = True
    awards = Award.objects.filter(user=user_object)
    qualifications =  Qualification.objects.filter(user=user_object)
    assistants = Assistant.objects.filter(user=user_object)
    average_rating = Rating.objects.filter(user=user_object).aggregate(Avg('stars'))['stars__avg']
    testimonials = Testimonial.objects.filter(person=user_object)
    company = Company.objects.filter(owner=user_object)
    rate_count = Rating.objects.filter(rated_by=request.user,user=user_object).values_list('stars',flat=True)
    if UserFollowing.objects.filter(following_user=request.user,user=user_object).exists():
        following_me = True
    else:
        following_me = False

    try:
        return render(request,'account/view_profile.html',{'company':company,'is_admin':is_admin,'following_me':following_me,'inbox_count':inbox_count,'unread_message_count':unread_message_count,'testimonials':testimonials,'user_object':user_object,'awards':awards,'qualifications':qualifications,'is_director':is_director,'is_producer':is_producer,'is_writer':is_writer,'user_object_is_writer':user_object_is_writer,'rate_count':rate_count[0],'average_rating':average_rating,'project_form':project_form,} )
    except:
        return render(request,'account/view_profile.html',{'company':company,'is_admin':is_admin,'following_me':following_me,'inbox_count':inbox_count,'unread_message_count':unread_message_count,'testimonials':testimonials,'user_object':user_object,'awards':awards,'qualifications':qualifications,'is_director':is_director,'is_producer':is_producer,'is_writer':is_writer,'user_object_is_writer':user_object_is_writer,'rate_count':rate_count,'average_rating':average_rating,'project_form':project_form,} )

def logout(request):
    request.session['is_logout'] = True
    user_logout(request)
    return redirect('/signin/')

@login_required(login_url='/signin/')
def following(request):
    followings= UserFollowing.objects.filter(user=request.user)
    unread_message_count  = Message.unread_count(request.user) 
    inbox_count = Chat.unread_count(request.user)
    context = {
        'followings' : followings,
        'unread_message_count':unread_message_count,
        'inbox_count':inbox_count,
    }    
    return render(request,'account/following.html', context)

@login_required(login_url='/signin/')
def followers(request):
    user_object = User.objects.get(id=request.user.id)
    followers = UserFollowing.objects.filter(following_user_id =user_object)
    unread_message_count  = Message.unread_count(request.user) 
    inbox_count = Chat.unread_count(request.user)
    context = {
        'followers' : followers,
        'user_object' : user_object,
        'inbox_count':inbox_count,
        'unread_message_count':unread_message_count,
    }
    
    return render(request,'account/followers.html', context)


@csrf_exempt
def ajax_add_as_assistant(request):

    if request.method == "POST":
        data = dict()
        senior_link = request.POST['seniorLink']
        senior = request.POST['senior']
        project_link = request.POST['projectLink']
        year = request.POST['year']
        if senior_link == "undefined":
            senior_link = None
        else:
            senior_link = User.objects.get(id=senior_link)

        if senior == "undefined":
            senior = ""
        if project_link == "undefined":
            project_link = None
        else:
            project_link = Project.objects.get(id=project_link)

        if not Assistant.objects.filter(user=request.user,project=project_link,senior_link=senior_link,senior=senior,year=year).exists():
            as_assistant = Assistant.objects.create(project=project_link,user=request.user,senior_link=senior_link,senior=senior,year=year)
            data['valid'] =True
            as_assistant = Assistant.objects.filter(user=request.user)
            data['html'] = render_to_string('account/as_assistant_list.html',{'as_assistant':as_assistant,},request)
        else:
            data['valid'] = False
            data['response'] = "Already added..!"

        return JsonResponse(data)

    else:
        data = dict()
        form = Assistant_Form(request=request)
        operation = "Add"
        data['form'] = render_to_string('account/as_assistant_form.html',{'form':form,'operation':operation,},request)
    
    return JsonResponse(data)


@csrf_exempt
def person_search(request):
    data = dict()
    name = request.POST['name']
    users = User.objects.filter(Q(last_name__icontains=name) | Q(first_name__icontains=name),groups__name="Director")
    data['users'] = render_to_string('account/person_list.html',{'users':users,'senior_name':name,},request)
    return JsonResponse(data)



@csrf_exempt
def as_assistant_edit(request,pk):
    data=dict()
    as_assistant = Assistant.objects.get(id=pk)

    if as_assistant.user == request.user:
        if request.method == "POST":
            senior_link = request.POST['seniorLink']
            senior = request.POST['senior']

            project_link = request.POST['projectLink']
            year = request.POST['year']
            if senior_link == "undefined":
                senior_link = None
            else:
                senior_link = User.objects.get(id=senior_link)

            if senior == "undefined":
                senior = ""
            if project_link == "undefined":
                project_link = None
            else:
                project_link = Project.objects.get(id=project_link)


            if not Assistant.objects.filter(project=project_link,user=request.user,senior_link=senior_link,senior=senior,year=year).exists():
                as_assistant = Assistant.objects.filter(id=pk).update(project=project_link,senior_link=senior_link,senior=senior,year=year)
                data['valid'] =True
                as_assistant = Assistant.objects.filter(user=request.user)
                data['html'] = render_to_string('account/as_assistant_list.html',{'as_assistant':as_assistant,},request)
            else:
                data['valid']= False
                data['response'] = "Already added..!"
        else:
            data['valid']= True
            data['form'] = render_to_string('account/as_assistant_form.html',{'as_assistant':as_assistant,'operation':'Update','pk':pk,},request)  
            
    else:
        data['valid'] = False
        data['Response']  = "Access denied..!"

    return JsonResponse(data)

@csrf_exempt
def ajax_add(request,model_name):
    data= dict()
    if model_name == "qualification":

        if request.method == "POST":
            form = Qualification_Form(request.POST,request=request,)

            if form.is_valid():
                form = form.save(commit=False)
                form.user= request.user
                form.save()
                data['valid']= True
                data['html'] = render_to_string('account/qualification.html',{},request)
            else:
                data['valid'] = False
                data['form'] = render_to_string('account/form.html',{'form':form,'operation':"Add",'model_name':model_name},request)

            
        else:
         
            form = Qualification_Form(request=request)
            data['form'] = render_to_string('account/form.html',{'form':form,'operation':"Add",'model_name':model_name},request)
            data['valid'] = True

    elif model_name == "award":
        if request.method == "POST":
            form = Award_Form(request.POST,request.FILES,request=request)

            if form.is_valid():
                form = form.save(commit=False)
                form.user= request.user          
                project = Project.objects.get(id=request.POST['project'])
                form.project = project

                x = float(request.POST.get('x'))
                y = float(request.POST.get('y'))
                w = float(request.POST.get('width'))
                h = float(request.POST.get('height'))
                files = request.FILES
                image_file = files.get('image', None)
                image = Image.open(image_file)              
                cropped_image = image.crop((x, y, w+x, h+y))
                resized_image = cropped_image.resize((500, 500), Image.ANTIALIAS)                         
                form.save()
                resized_image.save(form.image.path)
                form.save()
                data['valid']= True
                data['html'] = render_to_string('account/award-list.html',{},request)
            else:
                data['valid'] = False
                data['form'] = render_to_string('account/form.html',{'form':form,'operation':"Add",'model_name':model_name},request)


            
        else:
         
            form = Award_Form(request=request)
            data['form'] = render_to_string('account/form.html',{'form':form,'operation':"Add",'model_name':model_name},request)
            data['valid'] = True

    elif model_name == "project":        
        if request.method == "POST":           
            form = Project_Form(request.POST,request.FILES,request=request)
            if form.is_valid(): 
                genres = form.cleaned_data['genre']
                languages = form.cleaned_data['language']
                form = form.save(commit=False)   
                if request.POST.get('image'):
                    x = float(request.POST.get('x'))
                    y = float(request.POST.get('y'))
                    w = float(request.POST.get('width'))
                    h = float(request.POST.get('height'))
                    files = request.FILES
                    image_file = files.get('image', None)
                    image = Image.open(image_file)              
                    cropped_image = image.crop((x, y, w+x, h+y))
                    resized_image = cropped_image.resize((500, 500), Image.ANTIALIAS)
                    form.created_by = request.user                           
                    form.save()

                    for genre in genres:
                        form.genre.add(genre)
                    resized_image.save(form.image.path)
                else:
                    form.created_by = request.user                           
                    form.save()
                    for genre in genres:
                        form.genre.add(genre)

                
                for language in languages:          
                    form.language.add(language) 

                project = Project.objects.filter(id=form.id)
                data['valid'] = True
                data['project']= render_to_string('project/projects_list.html',{'projects':project,},request) 

            else:
                data['valid'] = False
                data['form']= render_to_string('project/project_form.html',{'project_form':form,'operation':"Add",'model_name':model_name},request) 
 
    elif model_name == "profile_project":  
        is_producer = False
        is_director = False
        is_writer = False
        for group in request.user.groups.all():
            if group.name  == "Writer":
                is_writer = True
            elif group.name  == "Producer":
                is_producer = True
            elif group.name  == "Director":
                is_director = True
            elif group.name == "Admin":
                is_admin = True 

        if request.method == "POST":           
            form = Project_Form(request.POST,request.FILES,request=request)
            if form.is_valid(): 
                project = form.save(commit=False)   

                if request.POST.get('image'):
                    x = float(request.POST.get('x'))
                    y = float(request.POST.get('y'))
                    w = float(request.POST.get('width'))
                    h = float(request.POST.get('height'))
                    files = request.FILES
                    image_file = files.get('image', None)
                    image = Image.open(image_file)              
                    cropped_image = image.crop((x, y, w+x, h+y))
                    resized_image = cropped_image.resize((500, 500), Image.ANTIALIAS)
                    project.created_by = request.user                           
                    project.save()
                    resized_image.save(project.image.path)
                else:
                    project.created_by = request.user                           
                    project.save()


                genres = form.cleaned_data['genre']
                for genre in genres:
                    project.genre.add(genre) 

                languages = form.cleaned_data['language']
                for language in languages:
                    language = Language.objects.get(language=language)
                    project.language.add(language) 


                
       
                data['valid'] = True
                data['project']= render_to_string('account/projects.html',{},request) 


            else:
                data['valid'] = False
                data['form'] = render_to_string('account/join_project_form.html',{'form':form,'operation':"Add",'model_name':model_name,'is_producer':is_producer,'is_director':is_director,'is_writer':is_writer,},request)
        else:
            joined_projects = Join_Project.objects.filter(user=request.user).values_list('project__id',flat=True)
            projects = Project.objects.exclude(id__in=joined_projects,created_by=request.user).order_by('-id')[:5]

            form = Project_Form(request=request)
            data['form'] = render_to_string('account/join_project_form.html',{'form':form,'operation':"Add",'model_name':model_name,'is_producer':is_producer,'is_director':is_director,'is_writer':is_writer,'projects':projects,},request)
            data['valid'] = True


    elif model_name == "Highlight":       
        if request.method == "POST":            
            project_id = request.POST['projectLink']
            project = Project.objects.get(id=project_id)

            if Highlight.objects.filter(project=project,user=request.user).exists():
                data['valid'] = False
                data['response'] =  "Already added..!"
            else:
                highlight = Highlight(project=project,user=request.user)
                highlight.save()
                data['html']= render_to_string('account/highlight-list.html',{},request) 
                data['valid'] = True                

        else:

            data['form']= render_to_string('account/highlights_form.html',{'operation':"Add",'model_name':model_name},request) 
       

    elif model_name == "company":       
        if request.method == "POST":            
            form = Company_Form(request.POST,request.FILES,request=request)

            if form.is_valid():
                form = form.save(commit=False)
                form.owner = request.user
                form.save()
                company = form
                data['html']= render_to_string('account/company.html',{'company':company,},request) 
                data['valid'] = True 
            else:
                data['form']= render_to_string('account/form.html',{'operation':"Add",'model_name':model_name,'form':form,},request) 


        else:
            form = Company_Form(request=request)
            data['form']= render_to_string('account/form.html',{'operation':"Add",'model_name':model_name,'form':form,},request) 
    
    elif model_name == "social_link":       
        if request.method == "POST":            
            form = Social_Link_Form(request.POST,request.FILES,request=request,instance=request.user)

            if form.is_valid():
                form = form.save(commit=False)
                form.owner = request.user
                form.save()
                company = form
                data['html']= render_to_string('account/social_link.html',{'company':company,},request) 
                data['valid'] = True 
            else:
                data['form']= render_to_string('account/form.html',{'operation':"Add",'model_name':model_name,'form':form,},request) 


        else:
            form = Social_Link_Form(request=request,instance=request.user)
            data['form']= render_to_string('account/form.html',{'operation':"Add",'model_name':model_name,'form':form,},request) 
       


    elif model_name == "join_project":

        if request.method == "POST":
            project_id = request.POST.get('project')

            if Project.objects.filter(id=project_id,created_by=request.user).exists() or Join_Project.objects.filter(project__id=project_id,user=request.user).exists():
                data['valid'] = False
                data['response'] = " Already Added..!"
            else:
                project = Project.objects.get(id=project_id)
                project = Join_Project.objects.create(project=project,user=request.user)
                project.save()
                data['valid'] = True
                data['html'] = render_to_string('account/projects.html',{},request)
            
        else:
            data['valid'] = False 
            data['response'] = "Access denied"

    return JsonResponse(data)

@csrf_exempt
def ajax_edit(request,model_name,pk):
    data= dict()
    if model_name == "qualification":

        qualification = Qualification.objects.get(id=pk)
        if qualification.user != request.user:
            data['valid'] = False
            return JsonResponse(data)

        if request.method == "POST":
            form = Qualification_Form(request.POST,instance=qualification,request=request)

            if form.is_valid():
                form = form.save(commit=False)
                form.user= request.user
                form.save()
                data['valid']= True
                data['html'] = render_to_string('account/qualification.html',{},request)
            else:
                data['valid'] = False
                data['form'] = render_to_string('account/form.html',{'form':form,'operation':"Add",'model_name':model_name},request)

        else:            
         
            form = Qualification_Form(instance=qualification,request=request)
            data['form'] = render_to_string('account/form.html',{'form':form,'operation':"Update",'model_name':model_name,'pk':pk,},request)
            data['valid'] = True

    elif model_name == "award":
        award = Award.objects.get(id=pk)

        if award.user != request.user:
            data['valid'] = False
            return JsonResponse(data)

        if request.method == "POST":
            award.project= Project.objects.get(id=request.POST['project'])
            award.save()
            form = Award_Form(request.POST,request.FILES,request=request,instance=award)

            if form.is_valid():
                form.save(commit=False)

                if 'image' in form.changed_data:
                    form = form.save(commit=False)
                    x = float(request.POST.get('x'))
                    y = float(request.POST.get('y'))
                    w = float(request.POST.get('width'))
                    h = float(request.POST.get('height'))
                    files = request.FILES
                    image_file = files.get('image', None)
                    image = Image.open(image_file)              
                    cropped_image = image.crop((x, y, w+x, h+y))
                    resized_image = cropped_image.resize((500, 500), Image.ANTIALIAS)
                    form.created_by = request.user                           
                    form.save()
                    resized_image.save(form.image.path)
                else:
                    form.save()

                data['valid']= True
                data['html'] = render_to_string('account/award-list.html',{},request)
                data['model'] = "award"
            else:
                data['valid'] = False         
                form = Award_Form(request=request,instance= award)
                data['form'] = render_to_string('account/form.html',{'form':form,'operation':"Update",'model_name':model_name,'project':award.project,'pk':pk,},request)
            
        else:
         
            form = Award_Form(request=request,instance= award)
            data['form'] = render_to_string('account/form.html',{'form':form,'operation':"Update",'model_name':model_name,'project':award.project,'pk':pk,},request)
            data['valid'] = True

    elif model_name == "highlight":
      
        highlight = Highlight.objects.get(id=pk)

        if highlight.project.created_by != request.user:
            data['valid'] = False
            return JsonResponse(data)

        if request.method == "POST":

            form = Highlight_Form(request.POST,request.FILES,request=request,instance=highlight)

            if form.is_valid():
                form.save()
                data['valid']= True
                data['model'] = "highlight"
                data['pk'] = highlight.project.id
                data['html'] = render_to_string('account/project_highlight.html',{'project':highlight.project,},request)
            else:
                data['valid'] = False
                data['form'] = render_to_string('account/form.html',{'form':form,'operation':"Update",'model_name':model_name,'pk':pk},request)

    
        else:   
            form = Highlight_Form(request=request,instance=highlight)     
            data['form'] = render_to_string('account/form.html',{'form':form,'operation':"Update",'model_name':model_name,'pk':pk,},request)
            
            data['valid'] = True
      
    elif model_name == "project":
        project = Project.objects.get(id=pk)
        if project.created_by != request.user:
            data['valid'] = False
            return JsonResponse(data)

        if request.method == "POST":          
            form = Project_Form(request.POST,request.FILES,request=request,instance=project)
            if form.is_valid():

                if 'image' in form.changed_data:
                    project = form.save(commit=False)
                    x = float(request.POST.get('x'))
                    y = float(request.POST.get('y'))
                    w = float(request.POST.get('width'))
                    h = float(request.POST.get('height'))
                    files = request.FILES
                    image_file = files.get('image', None)
                    image = Image.open(image_file)              
                    cropped_image = image.crop((x, y, w+x, h+y))
                    resized_image = cropped_image.resize((500, 500), Image.ANTIALIAS)
                    project.created_by = request.user                           
                    project.save()
                    resized_image.save(project.image.path)
                else:
                    project.save()

                    genres = form.cleaned_data['genre']
                    for genre in genres:
                        project.genre.add(genre)

                    languages = form.cleaned_data['language']
                    for language in languages:
                        language = Language.objects.get(language=language)
                        project.language.add(language) 
                        
                data['valid']= True
                data['html'] = render_to_string('account/projects.html',{},request)
              
            else:
                data['valid'] = False         
                data['form'] = render_to_string('account/project_form.html',{'form':form,'operation':"Update",'model_name':model_name,'project':project,'pk':pk,},request)
                
            
        else:        
            form = Project_Form(request=request,instance=project)
            data['form'] = render_to_string('account/project_form.html',{'form':form,'operation':"Update",'model_name':model_name,'project':project,'pk':pk,},request)
            data['valid'] = True

    elif model_name == "company":

        company = Company.objects.get(id=pk,owner=request.user)

        if request.method == "POST":

            form = Company_Form(request.POST,request.FILES,request=request,instance=company)

            if form.is_valid():
                form.save()
                company = Company.objects.get(id=pk)
                data['valid']= True
                data['html'] = render_to_string('account/company.html',{'company':company},request)
                data['model'] = model_name
            else:
                data['valid'] = False         
                data['form'] = render_to_string('account/form.html',{'form':form,'operation':"Update",'model_name':model_name,'pk':pk,},request)
            
        else:       

            form = Company_Form(request=request,instance=company)       
            data['form'] = render_to_string('account/form.html',{'form':form,'operation':"Update",'model_name':model_name,'pk':pk,},request)
            data['valid'] = True
    elif model_name == "testimonial":
        
        testimonial = Testimonial.objects.get(id=pk)
        project = testimonial.project
        if testimonial.user != request.user:
            data['valid'] = False
            return JsonResponse(data)

        if request.method == "POST": 
            project =Project.objects.get(id=request.POST['project'])
            testimonial.project = project
            testimonial.save()
                   
            form = Testimonial_Form(request.POST,request.FILES,request=request,instance=testimonial)
            if form.is_valid():

                form.save()
                data['valid']= True
                data['html'] = render_to_string('account/testimonial.html',{},request)
              
            else:
                data['valid'] = False         
                data['form'] = render_to_string('account/form.html',{'form':form,'operation':"Update",'model_name':model_name,'pk':pk,},request)
                
            
        else:        
            
            form = Testimonial_Form(request=request,instance=testimonial)
            data['form'] = render_to_string('account/form.html',{'project':project,'form':form,'operation':"Update",'model_name':model_name,'pk':pk,},request)
            data['valid'] = True



    elif model_name == "social_link":

        user = User.objects.get(id=request.user.id)

        if request.method == "POST":

            form = Social_Link_Form(request.POST,request.FILES,request=request,instance=user)

            if form.is_valid():
                form.save()                
                data['valid']= True

                data['html'] = render_to_string('account/social_link.html',{'user':user,},request)
                data['model'] = model_name
            else:
                data['valid'] = False         
                data['form'] = render_to_string('account/form.html',{'form':form,'operation':"Update",'model_name':model_name,'pk':pk,},request)
            
        else:       

            form = Social_Link_Form(request=request,instance=user)       
            data['form'] = render_to_string('account/form.html',{'form':form,'operation':"Update",'model_name':model_name,'pk':pk,},request)
            data['valid'] = True


    return JsonResponse(data)

@csrf_exempt
def ajax_delete(request,model_name,pk):
    data= dict()
    if model_name == "qualification":
        qualification = Qualification.objects.get(id=pk)
        if qualification.user == request.user:
            qualification.delete()
            data['valid']= True
            data['html'] = render_to_string('account/qualification.html',{},request)
            data['model'] = model_name
        else:
            data['valid'] = False
    elif model_name == "award":
        award = Award.objects.get(id=pk)
        if award.user == request.user:
            award.delete()
            data['valid']= True
            data['html'] = render_to_string('account/award-list.html',{},request)
            data['model'] = model_name
        else:
            data['valid'] = False

    elif model_name == "assistant":

        assistant = Assistant.objects.get(id=pk)
        if assistant.user == request.user:
            assistant.delete()
            data['valid']= True
            data['html'] = render_to_string('account/as_assistant_list.html',{},request)
            data['model'] = model_name
        else:
            data['valid'] = False

    elif model_name == "project":

        project = Project.objects.get(id=pk)
        if project.created_by == request.user:
            project.delete()
            data['valid']= True
            data['html'] = render_to_string('account/projects.html',{},request)
            data['model'] = model_name
        else:
            data['valid'] = False


    elif model_name == "company":

        company = Company.objects.get(id=pk)
        if company.owner == request.user:
            company.delete()
            data['valid']= True
            data['html'] = render_to_string('account/company.html',{},request)
            data['model'] = model_name
        else:
            data['valid'] = False

    elif model_name == "testimonial":

        testimonial = Testimonial.objects.get(id=pk)
        if testimonial.user == request.user:
            testimonial.delete()
            data['valid']= True
            data['html'] = render_to_string('account/testimonial.html',{},request)
            data['model'] = model_name
        else:
            data['valid'] = False

    elif model_name == "highlight":

        highlight = Highlight.objects.get(id=pk)
        project = highlight.project
        if highlight.project.created_by == request.user:
            highlight.delete()
            data['valid']= True
            data['pk'] = project.id
            data['html'] = render_to_string('account/project_highlight.html',{'project':project,},request)
            data['model'] = model_name
        else:
            data['valid'] = False

    elif model_name == "join_project":
        project = Join_Project.objects.get(id=pk)        
        if project.user == request.user:
            project.delete()
            data['valid']= True
            data['pk'] = project.id
            data['html'] = render_to_string('account/projects.html',{},request)
        else:
            data['valid'] = False

    return JsonResponse(data)

@login_required(login_url='/signin/')
def ajax_follow_unfollow(request,pk):
    data =  dict()    
    following_user_id = User.objects.get(id=pk)
    status = UserFollowing.follow_or_unfollow(user=request.user,following_user_id=following_user_id)
    data['followed'] = status
    return JsonResponse(data)


@login_required(login_url='/signin/')
def search_people(request):
    data = dict()
    user=request.user
    name = request.GET.get('name', None)
    page = request.GET.get('page', None)
    people_type = request.GET.get('people_type', None)

    is_producer = None
    is_writer = None
    is_director = None
    is_admin = None


    for group in user.groups.all():
        if group.name  == "Writer":
            is_writer = True
        elif group.name  == "Producer":
            is_producer = True
        elif group.name  == "Director":
            is_director = True
        elif group.name  == "Admin":
            is_admin = True

    if people_type == "producer":
        users = User.objects.filter(Q(last_name__icontains=name) | Q(first_name__icontains=name),groups__name="Producer").distinct()
    elif people_type == "writer":
        users = User.objects.filter(Q(last_name__icontains=name) | Q(first_name__icontains=name),groups__name="Writer").distinct()
    elif people_type == "director":
        users = User.objects.filter(Q(last_name__icontains=name) | Q(first_name__icontains=name),groups__name="Director").distinct()
    elif name:
        users = User.objects.filter(Q(last_name__icontains=name) | Q(first_name__icontains=name)).distinct()[:20]

    else:
        users = User.objects.order_by('-id').exclude(id=user.id)[:5]
    data['users'] = render_to_string('account/search_people.html',{'users':users,'page':page,'is_writer':is_writer,'is_producer':is_producer,'is_writer':is_writer,},request)    
    data['valid'] = True
    return JsonResponse(data)

@login_required(login_url='/signin/')
def write_testimonial(request,pk):  
    data = dict()  
    person =  User.objects.get(id=pk)   
    if request.method == "POST": 
        project_id = request.POST['project']
        try:
            project =Project.objects.get(id=project_id)
        except:
            project = None   
                   
        form = Testimonial_Form(request.POST,request.FILES,request=request)
        if form.is_valid():  
            person= User.objects.get(id=pk)
            testimonial = form.save(commit=False) 
            try:
                project =Project.objects.get(id=project_id)
                testimonial.project = project
            except:   
                pass           
            testimonial.user = request.user
            testimonial.person = person
            testimonial.save()
            data['valid'] = True   


        else:
            data['valid'] = False
            data['form'] = render_to_string('account/testimonial_form.html',{'form':form,'operation':"Add",'person':person,'project':project,},request)
    else:
        form = Testimonial_Form(request=request)

        data['form'] = render_to_string('account/testimonial_form.html',{'form':form,'operation':"Add",'person':person},request)
        data['valid'] = True

    return JsonResponse(data)

@login_required(login_url='/signin/')
def search(request):
    name = request.GET.get('name')
    genres = Genre.objects.all()
    formats = Format.objects.all()
    languages = Language.objects.all() 
    requirements = Open_To.objects.all()
    groups = Group.objects.exclude(name="Writer")
    project_form = Project_Form(request=request)

    if name:
        pass
    else:
        name = None


    context={
        'name':name,
        'groups':groups,
        'genres':genres,
        'formats':formats,
        'languages':languages,
        'requirements':requirements,
        'project_form':project_form,
        

    }
    return render(request,'search.html',context)



@login_required(login_url='/signin/')
def people_search(request):
    data = dict()
    if request.method == "POST":
        name = request.POST.get('name')
        genres =[ast.literal_eval(i) for i in request.POST.getlist('genre')] 
        formats =[ast.literal_eval(i) for i in request.POST.getlist('format')]
        languages =[ast.literal_eval(i) for i in request.POST.getlist('language')]
        requirements =[ast.literal_eval(i) for i in request.POST.getlist('requirement')]
        groups =[ast.literal_eval(i) for i in request.POST.getlist('group')]

        users = User.objects.all()
        if name:
            users = users.filter(Q(first_name__icontains = name) | Q(last_name__icontains = name))
        if genres:
            users = users.filter(specialization_of_genre__in=genres)
        if formats:
            users = users.filter(interested_format__in=formats)

        if languages:
            users = users.filter(languages_to_work__in=languages)

        if requirements:
            users = users.filter(open_to__in=requirements)

        if groups:
            users = users.filter(groups__in=groups)

        if name or languages or groups or formats or genres or name or requirements:
            pass
        else:
            users = None


        data['people'] = render_to_string('account/people.html',{'users':users,},request)
        data['valid'] = True

    return JsonResponse(data)


@login_required(login_url='/signin/')
def report_people(request,pk):
    reported_user = User.objects.get(id=pk)
    data = dict()
    if request.method == "POST":
        form = Report_People_Form(request.POST,request.FILES, request=request)

        if form.is_valid():
            form = form.save(commit=False)
            form.reported_by = request.user
            form.reported_user = reported_user
            form.save()
            data['valid'] = True
        else:
            data['valid'] = False
    else:
        form = Report_People_Form(request=request)

        data['form'] = render_to_string('account/report_people_form.html',{'form':form,'reported_user':reported_user,'operation':'Add'},request)


    return JsonResponse(data)
     
@login_required(login_url='/signin/')
def people_rating(request,user,rate):
    data = dict()
    user = User.objects.get(id=user)

    if Rating.objects.filter(user=user,rated_by=request.user).exists():
        rate = Rating.objects.filter(user=user,rated_by=request.user).update(stars=rate)
    else:
        rate = Rating.objects.create(user=user,rated_by=request.user,stars=rate)

    data['average_rating'] = Rating.objects.filter(user=user).aggregate(Avg('stars'))['stars__avg']
    return JsonResponse(data)


@login_required(login_url='/signin/')
def get_all_message(request,user):
    data = dict()
    message_to_user= User.objects.get(id=user)
    messages = Message.objects.filter((Q(message_by=request.user,message_to=message_to_user) | Q(message_by=message_to_user,message_to=request.user) )).order_by('id')
    make_read =  Message.objects.exclude(message_by=request.user).filter((Q(message_by=request.user,message_to=message_to_user) | Q(message_by=message_to_user,message_to=request.user))).update(unread=False)
    data['messages'] = render_to_string('account/normal_message.html',{'messages':messages,'receiver':message_to_user,},request)
    return JsonResponse(data)
    
@login_required(login_url='/signin/')
def message_to(request,user):
    data= dict()
    message = request.POST['message']
    files = request.FILES
    message_file = files.get('message-file', None)
    msg_type = "normal_message"
    message_to = User.objects.get(id=user)

    if message_file:
        message = Message(message_by=request.user,message=message,m_file=message_file,message_to=message_to)
    else:
        message = Message(message_by=request.user,message=message,message_to=message_to)

    message.save(post_id=None,shown_by=None,msg_type=msg_type,message_by=None)
    messages = Message.objects.filter((Q(message_by=request.user,message_to=message_to) | Q(message_by=message_to,message_to=request.user) )).order_by('id')
    data['messages'] = render_to_string('account/message.html',{'messages':messages,},request)
    data['valid'] = True
    return JsonResponse(data)

@login_required(login_url='/signin/')
def inbox(request):
    conversations = Conversation.objects.filter(Q(sender=request.user) | Q(receiver=request.user)).distinct()
    chats = Chat.objects.filter(Q(conversation__sender=request.user) | Q(conversation__receiver=request.user)).annotate(last=Max('conversation__chat__date')).filter(date=F('last')).order_by('-conversation__date')
    unread_message_count = Message.unread_count(request.user) 
    readed_count = Chat.readed_count(request.user)
    inbox_count = Chat.unread_count(request.user)

    is_admin = False
    for group in request.user.groups.all():
        if group.name  == "Admin":
            is_admin = True


    context={
        'is_admin':is_admin,
        'chats':chats,
        'unread_message_count':unread_message_count,
        'inbox_count':inbox_count,
        'readed_message_count':readed_count,
    }
    return render(request,'inbox.html',context)


@login_required(login_url='/signin/')
def all_peoples(request):
    users= User.objects.filter(is_active=True).exclude(Q(id=request.user.id) | Q(is_superuser=True))
    unread_message_count  = Message.unread_count(request.user) 
    inbox_count = Chat.unread_count(request.user)
    context = {
        'users' : users,
        'unread_message_count':unread_message_count,
        'inbox_count':inbox_count,
    }    
    return render(request,'account/all_peoples.html', context)


def get_inbox_chat(request,user):
    data = dict()
    receiver = User.objects.get(id=user)    
    blocked_list = Blocked_User.objects.filter(Q(blocked_by=receiver,blocked_user=request.user) | Q(blocked_by=request.user,blocked_user=receiver))
    blocked_by_receiver = False
    blocked_by_sender = False
    for blocked in blocked_list:
        if blocked.blocked_by == request.user:
            blocked_by_sender = True
        elif blocked.blocked_user == request.user:
            blocked_by_receiver = True
    try:
        conversation = Conversation.objects.get(Q(sender=request.user,receiver=receiver) | Q(sender=receiver,receiver=request.user))
        chats = Chat.objects.filter(conversation=conversation)
        make_read = Chat.objects.exclude(sender=request.user).filter(conversation=conversation,unread=True).update(unread=False)


    except:
        chats = None

    if request.GET.get('page')  == "inbox":    
        data['messages'] = render_to_string('account/get_all_chat.html',{'chats':chats,'receiver':receiver,'blocked_by_sender':blocked_by_sender,'blocked_by_receiver':blocked_by_receiver,},request)
    else:
        data['messages'] = render_to_string('account/normal_message.html',{'chats':chats,'receiver':receiver,'blocked_by_sender':blocked_by_sender,'blocked_by_receiver':blocked_by_receiver,},request)

    return JsonResponse(data)


def chat_to(request,user):
    data= dict()
    message = request.POST['message']
    files = request.FILES
    chat_file = files.get('message-file', None)
    chat_to = User.objects.get(id=user)

    if chat_file:
        chat = Chat(sender=request.user,message=message,m_file=chat_file)
    else:
        chat = Chat(sender=request.user,message=message)

    chat.save(receiver=chat_to)

    conversation = Conversation.objects.get(id=chat.conversation.id)
    chats =  Chat.objects.filter(conversation=conversation)
    data['messages'] = data['messages'] = render_to_string('account/chat_message.html',{'chats':chats,'receiver':user,},request)
    data['valid'] = True
    return JsonResponse(data)



def ajax_block_unblock(request,pk):
    data =  dict()    
    blocked_user = User.objects.get(id=pk)
    status = Blocked_User.block_unblock(user=request.user,blocked_user=blocked_user)
    data['blocked'] = status
    return JsonResponse(data)



def ajax_project_highlight(request,pk):
    data = dict()
    project = Project.objects.get(id=pk)

    if project.created_by == request.user:    
        if request.method == "POST":
            form = Highlight_Form(request.POST,request.FILES, request=request)
            if form.is_valid():
                highlight = form.save(commit=False)
                highlight.project = project
                highlight.save()
                
                data['valid'] = True
                data['pk'] = pk
                highlights = Highlight.objects.filter(project=project)
                data['html'] = render_to_string('account/project_highlight.html',{'project':project,},request)
            else:
                data['valid'] = False
                data['form'] = render_to_string('account/form.html',{'form':form,'model_name':'Highlight','operation':'Add','pk':pk},request)

        else:
            form = Highlight_Form(request=request)
            data['form'] = render_to_string('account/form.html',{'form':form,'model_name':'Highlight','operation':'Add','pk':pk},request)


    return JsonResponse(data)



@login_required(login_url='/signin/')
def change_password(request):     
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.is_default_password=False
            user = form.save()
            update_session_auth_hash(request, user)  # Important!
            return render(request, 'account/change_password.html', {'updated': True })

        else:
            messages.error(request, 'Please correct the error below.')
    else:
        form = PasswordChangeForm(request.user)
    return render(request, 'account/change_password.html', {
        'form': form
    })


def privacy_policy(request):   
    context = {
        'unread_message_count':0,
        'inbox_count':0,
    }
    return render(request, 'website/privacy_policy.html', context)



def terms_conditions(request):   
    context = {
        'unread_message_count':0,
        'inbox_count':0,
    }
    return render(request, 'website/terms_conditions.html', context)



def otp_validate(request):
    context = dict()
    try:
        random_otp = request.session['random_otp']
        context['has_otp'] = True
    except:
        context['has_otp'] = False
        random_otp = False        

    if request.method == "POST":

        get_otp = request.POST.get('otp')
        if int(get_otp) == int(random_otp):           
            otp_generated_at = df.strptime(request.session['otp_generated_at'], '%Y-%m-%d %H:%M:%S.%f')
            date_time_now = datetime.datetime.now()
            difference = date_time_now - otp_generated_at
            difference = difference.total_seconds() / 60.0                    
            if difference > 5:
                context['time_exceeded'] = True                
            else:
                request.session['mobile_verified'] = True
                context['verified'] = True          

        else:
            context['wrong_code'] = True
           
    else: 
        context['new_form'] = True

    return JsonResponse(context)


def generate_otp(request):
    data = dict()
 
    if request.method == "POST":
        mobile_no = request.POST.get('mobile_no')
        if User.objects.filter(mobile_no=mobile_no).exists():
            data['user_exists'] = True
            
        else:
            #otp send 
            #remove old session 
            if "random_otp" in request.session.keys():
                del request.session["random_otp"]

            if "mobile_no" in request.session.keys():
                del request.session["mobile_no"]

            if "otp_generated_at" in request.session.keys():
                del request.session["otp_generated_at"]

            random_otp = random.randint(1000,9999)
            apikey = 'NjE0MzQ5NjY2ZDQ1NTc0MTQ4NDg0MzY0MzA1NDcyNmI='
            numbers = '+91'+str(mobile_no)
            sender = "SWPRTL"
            message = str(random_otp) +' is your OTP to register with Screen Writers. For any help, please contact us at contact@screenwriters.in'
            params = {'apikey': apikey, 'numbers': numbers, 'message' : message, 'sender': sender}

            f = urllib.request.urlopen('https://api.textlocal.in/send/?'
                + urllib.parse.urlencode(params))
            status = f.read(), f.code
   
            request.session['random_otp'] = random_otp
            request.session['mobile_no'] = mobile_no            
            request.session['otp_generated_at'] = str(datetime.datetime.now())
            data['user_exists'] = False
    else:
        pass

    return JsonResponse(data)


def otp_session_remove(request):
    data = dict()
    if "random_otp" in request.session.keys():
        del request.session["random_otp"]

    if "mobile_no" in request.session.keys():
        del request.session["mobile_no"]

    if "otp_generated_at" in request.session.keys():
        del request.session["otp_generated_at"]

    return JsonResponse(data)





def reset_password(request):
    context = {}
    if request.user.is_authenticated:
        return redirect('home')

    if request.method == "POST":
        data = dict()
        mobile_no = request.POST.get('mobile_no')
        if User.objects.filter(mobile_no=mobile_no).exists():

            #otp send 
            #remove old session 
            if "random_otp" in request.session.keys():
                del request.session["random_otp"]

            if "mobile_no" in request.session.keys():
                del request.session["mobile_no"]

            if "otp_generated_at" in request.session.keys():
                del request.session["otp_generated_at"]

            random_otp = random.randint(1000,9999)

            apikey = 'NjE0MzQ5NjY2ZDQ1NTc0MTQ4NDg0MzY0MzA1NDcyNmI='
            numbers = '+91'+str(mobile_no)
            sender = "SWPRTL"
            message = str(random_otp) +' is your Screen Writers password reset code. For any help, please contact us at contact@screenwriters.in'
            params = {'apikey': apikey, 'numbers': numbers, 'message' : message, 'sender': sender}
            f = urllib.request.urlopen('https://api.textlocal.in/send/?'
                + urllib.parse.urlencode(params))
  

            request.session['random_otp'] = random_otp
            request.session['mobile_no'] = mobile_no            
            request.session['otp_generated_at'] = str(datetime.datetime.now())
            data['user_exists'] = False
            
        else:
            data['account_not_exist'] = True

        return JsonResponse(data)

    else:
        #remove old session 
        if "random_otp" in request.session.keys():
            del request.session["random_otp"]

        if "mobile_no" in request.session.keys():
            del request.session["mobile_no"]

        if "otp_generated_at" in request.session.keys():
            del request.session["otp_generated_at"]

    return render(request, 'registration/reset_password.html', context)



def reset_password_form(request):

    if request.user.is_authenticated:
        return redirect('home')

    context =  {}

    try:
        random_otp =  request.session["random_otp"]
        mobile_no = request.session["mobile_no"]
        user = User.objects.get(mobile_no=mobile_no)
           
        otp_generated_at = df.strptime(request.session['otp_generated_at'], '%Y-%m-%d %H:%M:%S.%f')
        date_time_now = datetime.datetime.now()
        difference = date_time_now - otp_generated_at
        difference = difference.total_seconds() / 60.0
                    
        if difference > 5:
            context['time_exceeded'] = True               

    except:
        user = None
    

    if request.method == "POST":
        form = SetPasswordForm(user,request.POST )
        if form.is_valid():    
            form.save() 
            if "random_otp" in request.session.keys():
                del request.session["random_otp"]

            if "mobile_no" in request.session.keys():
                del request.session["mobile_no"]

            if "otp_generated_at" in request.session.keys():
                del request.session["otp_generated_at"]


            return redirect('password_reset_complete')
        else:
            context['form'] = form
    else:
        context['form'] = SetPasswordForm(user)


    context['user'] = user

    return render(request, 'registration/reset_password_form.html', context)




@login_required(login_url='signin')
def view_my_submission(request,pk):
    try:
        registration = Registration.objects.get(user=request.user,id=pk)
    except:
        registration = None

    is_producer = None
    is_writer = None
    is_director = None
    is_admin = None


    for group in request.user.groups.all():
        if group.name  == "Writer":
            is_writer = True
        elif group.name  == "Producer":
            is_producer = True
        elif group.name  == "Director":
            is_director = True
        elif group.name  == "Admin":
            is_admin = True
    unread_message_count  = Message.unread_count(request.user) 
    inbox_count = Chat.unread_count(request.user)

    context={
        'registration':registration,
        'is_admin': is_admin,
        'is_producer':is_producer,
        'is_writer':is_writer,
        'is_director':is_director,

        'unread_message_count':unread_message_count,
        'inbox_count':inbox_count,
    }
    return render(request,'account/view_my_submission.html',context)



@login_required(login_url='/signin/')
def change_mobile_number(request): 
    context = {}
    
    if request.method == "POST" :
        otp = request.POST.get('otp',None)
        context['get_method'] = False

        try:
            random_otp =  request.session["random_otp"]
            mobile_no = request.session["mobile_no"]
            current_no = request.session["current_no"]
            verified = request.session["verified"]
            
            user = User.objects.get(mobile_no=current_no)
            
            otp_generated_at = df.strptime(request.session['otp_generated_at'], '%Y-%m-%d %H:%M:%S.%f')
            date_time_now = datetime.datetime.now()
            difference = date_time_now - otp_generated_at
            difference = difference.total_seconds() / 60.0
                        
            if difference > 5:
                context['time_exceeded'] = True

                #remove old session 
                if "random_otp" in request.session.keys():
                    del request.session["random_otp"]

                if "mobile_no" in request.session.keys():
                    del request.session["mobile_no"]
                
                if "current_no" in request.session.keys():
                    del request.session["current_no"]

                if "otp_generated_at" in request.session.keys():
                    del request.session["otp_generated_at"] 
            else:


                user.mobile_no = mobile_no
                user.save()
                return redirect('my_profile')


        except:
            context['error'] = True




    else:
        #remove old session 
        if "random_otp" in request.session.keys():
            del request.session["random_otp"]

        if "mobile_no" in request.session.keys():
            del request.session["mobile_no"]
        
        if "current_no" in request.session.keys():
            del request.session["current_no"]

        if "otp_generated_at" in request.session.keys():
            del request.session["otp_generated_at"]

        context['get_method'] = True

    
    return render(request, 'account/change_mobile_no.html', context)




@login_required(login_url='/signin/')
def generate_otp_for_change_mobile_number(request):     
    if request.method == "POST":
        data = dict()
        mobile_no = request.POST.get('mobile_no')
        current_no = request.POST.get('current_no')
        if User.objects.filter(mobile_no=current_no,id=request.user.id).exists():
            if not User.objects.filter(mobile_no=mobile_no).exists():
                #otp send 
                #remove old session 
                if "random_otp" in request.session.keys():
                    del request.session["random_otp"]

                if "mobile_no" in request.session.keys():
                    del request.session["mobile_no"]

                if "otp_generated_at" in request.session.keys():
                    del request.session["otp_generated_at"]

                random_otp = random.randint(1000,9999)

                apikey = 'NjE0MzQ5NjY2ZDQ1NTc0MTQ4NDg0MzY0MzA1NDcyNmI='
                numbers = '+91'+str(mobile_no)
                sender = "SWPRTL"
                message = str(random_otp) +' is your Screen Writers mobile number change code. For any help, please contact us at contact@screenwriters.in'
                params = {'apikey': apikey, 'numbers': numbers, 'message' : message, 'sender': sender}
                f = urllib.request.urlopen('https://api.textlocal.in/send/?'
                    + urllib.parse.urlencode(params))
    

                request.session['random_otp'] = random_otp
                request.session['mobile_no'] = mobile_no 
                request.session['current_no'] = current_no    
                request.session['verified'] = True        
                request.session['otp_generated_at'] = str(datetime.datetime.now())
                data['user_exists'] = False
            else:
                data['user_exists'] = True

            
        else:
            data['account_not_exist'] = True

        return JsonResponse(data)


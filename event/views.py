from django.shortcuts import render, redirect
from django.utils.html import strip_tags
from.models import  Event, Registration
from account.models import User
import random
from.forms import Event_Registration, Signup_Form
from django.contrib.auth.hashers import make_password
from django.contrib.auth.models import Group
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from django.core.mail import send_mail
from django.http import  JsonResponse
import datetime
from datetime import datetime as df
import urllib.request
import urllib.parse
import requests
from datetime import date
# Create your views here.


def event_signup(request,slug):
    

    try:
        event = Event.objects.get(slug=slug,open_date__lte=date.today(), close_date__gte=date.today())

    except:
        event = None

    try:
        mobile_verified = request.session['mobile_verified']
        random_otp = request.session['random_otp']
        mobile_no = request.session["mobile_no"]
    except:
        mobile_verified = False
        random_otp = None
        mobile_no = None
    


    if request.method == "POST" and mobile_verified:
        data = dict()
        form = Signup_Form (request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.username=form.cleaned_data['mobile_no']
            user.is_active = True
            user.save()    
 


            registration = Registration.objects.create(user=user,event=event,age=form.cleaned_data['age'],marital_status=form.cleaned_data['marital_status'],profession=form.cleaned_data['profession'])

            

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
            return redirect('/registered_successfully/')

        else:         
            print(form.errors.as_data())
    else:       
        form = Signup_Form()

    context = {
            'form':form,
            'event':event,
            'random_otp':random_otp,
            'mobile_no':mobile_no,
            'mobile_verified':mobile_verified,
           }

    return render(request,'event/event_registration.html',context)

    

def registered(request):
    return render(request,'event/registered.html')


def event_registration(request,slug):

    try:
        event = Event.objects.get(slug=slug,open_date__lte=date.today(), close_date__gte=date.today())
        registration,created = Registration.objects.get_or_create(user=request.user,event=event)

    except:
        event = None
        registration = None


    if request.method == "POST" :
        data = dict()
        form = Event_Registration (request.POST,request.FILES,instance=registration)
        if form.is_valid():
            form.save()
            return redirect('/submitted_successfully/')

        else:         
            print(form.errors.as_data())
    else:       
        form = Event_Registration(instance=registration)

    context = {
            'form':form,
            'event':event,
            'registration':registration,
         
           }

    return render(request,'event/complete_event_registration.html',context)


def submitted(request):
    return render(request,'event/submitted.html')


  
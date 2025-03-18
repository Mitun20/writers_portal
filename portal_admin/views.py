from django.http.response import JsonResponse
from django.shortcuts import render
from account.models import User, Report_People, Chat, UserFollowing
from project.models import Post, Report, Message
from django.db.models import Q
from django.views.generic import ListView
from project.models import Post
from django.views.generic.edit import DeleteView
from django.template.loader import render_to_string
from django.core.mail import EmailMessage
from django.contrib.auth.decorators import login_required, user_passes_test
import datetime
from django.contrib.sites.shortcuts import get_current_site
from django.utils.html import strip_tags
from django.core.mail import send_mail
from event.models import Event, Registration
from django.core.paginator import Paginator
from event.forms import Event_Form

# Create your views here.

def is_admin(user):
    return user.groups.filter(name='Admin').exists()

@user_passes_test(is_admin,login_url='signin') #Authorization
def portal_admin(request):
    users = User.objects.filter(groups__name__in=('Producer','Writer','Director')).order_by('-id').distinct()[:20]        
    unread_message_count  = Message.unread_count(request.user) 
    inbox_count = Chat.unread_count(request.user)
    context  = {
        'users':users,
        'unread_message_count':unread_message_count,
        'inbox_count':inbox_count,
        'is_admin':True,

    }
    return render(request,'portal_admin/home.html',context)

@user_passes_test(is_admin,login_url='signin') #Authorization
def user_active_inactive(request,pk):
    data =  dict()    
    user = User.objects.get(id=pk)
    info =  request.POST.get('info',None)
    status = User.active_or_inactive(user=user,info=info)
    data['active'] = status
    return JsonResponse(data)





class UserListView(ListView):
    paginate_by = 2
    model = User
    template_name = "portal_admin/all_people.html"
    context_object_name = 'users'

class PostListView(ListView):
    paginate_by = 5
    model = Post
    template_name = "portal_admin/all_posts.html"
    context_object_name = 'posts'



    def get_queryset(self):
        queryset = super().get_queryset()
        queryset = queryset.filter(Q(call__isnull=False) | Q(pitch__isnull=False))
        return queryset

@user_passes_test(is_admin,login_url='signin') #Authorization
def post_cannot_open(request,pk):
    data = dict()
    if request.user.groups.filter(name='Admin').exists():
        report =  request.POST['problem']
        post = Post.objects.get(id=pk)
        status = Post.open_close(post=post,report=report)
        data['closed'] =  status       
    else:
        data['closed'] =  False

    return JsonResponse(data)

@user_passes_test(is_admin,login_url='signin') #Authorization
def view_post(request,pk):
    if request.user.groups.filter(name='Admin').exists():
        post = Post.objects.get(id=pk)
        unread_message_count  = Message.unread_count(request.user) 
        inbox_count = Chat.unread_count(request.user)
        return render(request,'portal_admin/view_post.html',{'post':post,'is_admin':True,'unread_message_count':unread_message_count,'inbox_count':inbox_count,})



@user_passes_test(is_admin,login_url='signin') #Authorization
def view_people_report(request):
    if request.user.groups.filter(name='Admin').exists():
        post = Report_People.objects.all
        return render(request,'portal_admin/view_post.html',{'post':post,'is_admin':True,})


@user_passes_test(is_admin,login_url='signin') #Authorization
def ajax_delete(request,parent_model_name,pk):
    
    if request.user.groups.filter(name='Admin').exists():
        data = dict()
        if parent_model_name == "post":
            status = Report.delete(id=pk)
            data['deleted'] = status

        elif parent_model_name == "user":
            status = Report_People.delete(id=pk)
            data['deleted'] = status

            
        return JsonResponse(data)


class ReportPostListView(ListView):
    paginate_by = 5
    model = Post
    template_name = "portal_admin/view_reported_posts.html"
    context_object_name = 'posts'

    def get_queryset(self):
        queryset = super().get_queryset()
        queryset = queryset.filter(reports__isnull=False).distinct()
        return queryset


class ReportUserListView(ListView):
    paginate_by = 2
    model = User
    template_name = "portal_admin/view_reported_peoples.html"
    context_object_name = 'users'

    def get_queryset(self):
        queryset = super().get_queryset()
        queryset = queryset.filter(reports__isnull=False).distinct()
        return queryset


@user_passes_test(is_admin,login_url='signin') #Authorization
def statistics(request,pk):
    if request.user.groups.filter(name='Admin').exists():
        user_object = User.objects.get(id=pk)
        is_writer = False
        is_producer = False
        is_director = False
        is_admin = False

        unread_message_count  = Message.unread_count(request.user)
        inbox_count = Chat.unread_count(request.user) 
        for group in user_object.groups.all():
            if group.name  == "Writer":
                is_writer = True
            elif group.name  == "Producer":
                is_producer = True
            elif group.name  == "Director":
                is_director = True
            elif group.name == "Admin":
                is_admin = True

        context = {
            'is_admin' : True,
            'is_writer' :is_writer,
            'is_producer':is_producer,
            'is_director':is_director,
            'user_object':user_object,
            'unread_message_count':unread_message_count,
            'inbox_count':inbox_count,
        }
    

        return render(request,'portal_admin/view_user_statistics.html',context)

@user_passes_test(is_admin,login_url='signin')
def portal_admin_home_filter(request):
    data = dict()
    model = request.POST['model']

    if model == "user":
        filter_type = request.POST['filter_type']    
        users = User.portal_admin_filter(filter_type=filter_type)
        data['html'] = render_to_string('portal_admin/people_filter.html',{'users':users,},request)
    elif model == "post":
        filter_type = request.POST['filter_type'] 
        posts = Post.portal_admin_filter(filter_type=filter_type)
        print(posts)
        data['html'] = render_to_string('portal_admin/post_filter.html',{'posts':posts,},request)


    return JsonResponse(data)



@user_passes_test(is_admin,login_url='signin') #Authorization
def view_posts(request):
    filter_type = "recent"
    posts = Post.portal_admin_filter(filter_type=filter_type)       
    unread_message_count  = Message.unread_count(request.user) 
    inbox_count = Chat.unread_count(request.user)
    context  = {
        'is_admin' : True,
        'posts':posts,
        'unread_message_count':unread_message_count,
        'inbox_count':inbox_count,

    }
    return render(request,'portal_admin/view_posts.html',context)

@user_passes_test(is_admin,login_url='signin') #Authorization
def skip_all_reports(request,model,pk):
    data = dict()
    if model == "post":
        data['status'] = Report.skip_all_reports(post=pk)
    elif model == "user":
        data['status'] = Report_People.skip_all_reports(user=pk)
    return JsonResponse(data)
    
@user_passes_test(is_admin,login_url='signin') #Authorization
def ajax_fetch(request,model,pk):
    data = dict()
    user = User.objects.get(id=pk)

    if model == "report":
        reports = Report_People.objects.filter(reported_user=user)
        data['type'] = "report"
        data['html'] = render_to_string('portal_admin/fetch_report.html',{'reports':reports,},request)
    elif model == "call":
        posts = Post.objects.filter(call__isnull=False,call__owner=user)
        data['html'] = render_to_string('portal_admin/fetch_post.html',{'posts':posts,'model':'Call',},request)
        data['type'] = "call"
    elif model == "story":        
        posts = Post.objects.filter(pitch__isnull=False,pitch__owner=user)
        data['html'] = render_to_string('portal_admin/fetch_post.html',{'posts':posts,'model':'Pitch',},request)
        data['type'] = "pitch"
    elif model == "following":        
        users = UserFollowing.objects.filter(user=user)
        data['html'] = render_to_string('portal_admin/fetch_user.html',{'users':users,'type':'following',},request)
        data['type'] = "following"

    elif model == "follower":        
        users = UserFollowing.objects.filter(following_user=user)
        data['html'] = render_to_string('portal_admin/fetch_user.html',{'users':users,'type':'follower',},request)
        data['type'] = "follower"
    return JsonResponse(data)



def report(request):
    unread_message_count  = Message.unread_count(request.user) 
    inbox_count = Chat.unread_count(request.user)
    posts = Post.objects.filter(reports__is_active=True).distinct()
    
    context = {
        'is_admin' : True,
        'unread_message_count':unread_message_count,
        'inbox_count':inbox_count,
        'posts':posts,

    }
    return render(request,'portal_admin/report.html',context)


def portal_admin_report_filter(request):
    data = dict()
    filter_type = request.POST['filter_type'] 

    if filter_type == "post":        
        posts = Post.objects.filter(reports__is_active=True).distinct()
        data['html'] = render_to_string('portal_admin/fetch_reported_post.html',{'posts':posts,},request)
        data['type'] = "post"

    elif filter_type == "people":
        users = User.objects.filter(reports__is_active=True).distinct()
        data['html'] = render_to_string('portal_admin/fetch_reported_user.html',{'users':users,},request)
        data['type'] = "people"

    return JsonResponse(data)


@login_required
def draw_usage(request):
    data = dict()
    day_count = 10
    labels = []     
    call_count =[]
    pitch_count =[]
    user_count=[]
    delta = datetime.timedelta(days=day_count)    
    end_date = datetime.datetime.now() + datetime.timedelta(days = 1)
    
    start_date = end_date - delta
    s_date = start_date
    delta = datetime.timedelta(days=1)
    
    while start_date <= end_date: 
        labels.append(str(start_date.date()))       
        start_date += delta         
    
    for label in labels:     
     call_value = Post.objects.filter(date__date=label,call__isnull=False,active=True).count()     
     call_count.append(call_value)     
    
    for label in labels: 
     pitch_value =Post.objects.filter(date__date=label,pitch__isnull=False,active=True).count()     
     pitch_count.append(pitch_value)   
    
    for label in labels: 
     user_value =User.objects.filter(registered_on=label,is_active=True).count()    
     user_count.append(user_value)   
    
    
    return render(request,'portal_admin/draw.html',{'call_count':call_count,'labels':labels,'pitch_count':pitch_count,'user_count':user_count})

def draw_chart(request):
    data = dict()
    day_count = int(request.GET.get('days'))
    labels = []     
    call_count =[]
    pitch_count =[]
    user_count=[]
    delta = datetime.timedelta(days=day_count)    
    end_date = datetime.datetime.now() + datetime.timedelta(days = 1)    
    start_date = end_date - delta
    s_date = start_date
    delta = datetime.timedelta(days=1)    
    while start_date <= end_date: 
        labels.append(str(start_date.date()))       
        start_date += delta          
            
    for label in labels:     
     call_value = Post.objects.filter(date__date=label,call__isnull=False,active=True).count()     
     call_count.append(call_value)    
    
    for label in labels: 
     pitch_value =Post.objects.filter(date__date=label,pitch__isnull=False,active=True).count()     
     pitch_count.append(pitch_value)   

    for label in labels: 
     user_value =User.objects.filter(registered_on=label,is_active=True).count()    
     user_count.append(user_value)   
     
    
    return JsonResponse(data)

@login_required
def draw_usage(request):
    data = dict()
    day_count = 10
    labels = []     
    call_count =[]
    pitch_count =[]
    user_count=[]
    delta = datetime.timedelta(days=day_count)    
    end_date = datetime.datetime.now() + datetime.timedelta(days = 1)
    
    start_date = end_date - delta
    s_date = start_date
    delta = datetime.timedelta(days=1)
    
    while start_date <= end_date: 
        labels.append(str(start_date.date()))       
        start_date += delta         
    
    for label in labels:     
     call_value = Post.objects.filter(date__date=label,call__isnull=False,active=True).count()     
     call_count.append(call_value)     
    
    for label in labels: 
     pitch_value =Post.objects.filter(date__date=label,pitch__isnull=False,active=True).count()     
     pitch_count.append(pitch_value)   
    
    for label in labels: 
     user_value =User.objects.filter(registered_on=label,is_active=True).count()    
     user_count.append(user_value)   
    
    
    return render(request,'portal_admin/draw.html',{'call_count':call_count,'labels':labels,'pitch_count':pitch_count,'user_count':user_count})

def draw_chart(request):
    data = dict()
    day_count = int(request.GET.get('days'))
    labels = []     
    call_count =[]
    pitch_count =[]
    user_count=[]
    delta = datetime.timedelta(days=day_count)    
    end_date = datetime.datetime.now() + datetime.timedelta(days = 1)    
    start_date = end_date - delta
    s_date = start_date
    delta = datetime.timedelta(days=1)    
    while start_date <= end_date: 
        labels.append(str(start_date.date()))       
        start_date += delta          
            
    for label in labels:     
     call_value = Post.objects.filter(date__date=label,call__isnull=False,active=True).count()     
     call_count.append(call_value)    
    
    for label in labels: 
     pitch_value =Post.objects.filter(date__date=label,pitch__isnull=False,active=True).count()     
     pitch_count.append(pitch_value)   

    for label in labels: 
     user_value =User.objects.filter(registered_on=label,is_active=True).count()    
     user_count.append(user_value)   
     
    
    return JsonResponse(data)


def people_search(request):
    data = dict()
    user=request.user
    name = request.GET.get('name', None)
    people_type = request.GET.get('people_type', None)
    if people_type == "producer":
        users = User.objects.filter(Q(last_name__icontains=name) | Q(first_name__icontains=name),groups__name="Producer").distinct()[:100]
    elif people_type == "writer":
        users = User.objects.filter(Q(last_name__icontains=name) | Q(first_name__icontains=name),groups__name="Writer").distinct()[:100]
    elif people_type == "director":
        users = User.objects.filter(Q(last_name__icontains=name) | Q(first_name__icontains=name),groups__name="Director").distinct()[:100]

    else:
        users = User.objects.filter(Q(last_name__icontains=name) | Q(first_name__icontains=name),groups__name__in=('Producer','Writer','Director')).distinct()[:100]
    data['users'] = render_to_string('portal_admin/search_people.html',{'users':users,},request)    
    data['valid'] = True
    return JsonResponse(data)

    



@user_passes_test(is_admin,login_url='signin')
def admin_approve(request,pk,action):

    data = dict()
    user = User.objects.get(id=pk)
    if action == "approve":
        user.admin_approval = True
        user.is_active = True
        user.save()


        status = True
        mail_subject = 'Screen Writers Account -  Reg.'
        
        message = render_to_string('mail/admin_approval.html', {
            'status': status,
            'user': user,         
         
        })

        plain_message = strip_tags(message)
        to_email = user.email
        from_email='Screen Writers'
        send_mail(mail_subject,plain_message,from_email,[to_email,],html_message=message,)


        data['status'] = "approved"
        
    elif action =="disapprove":
        status = False
        mail_subject = 'Screen Writers Account -  Reg.'
        
        message = render_to_string('mail/admin_approval.html', {
            'status': status,
            'user': user,         
         
        })

        plain_message = strip_tags(message)
        to_email = user.email
        from_email='Screen Writers'
        send_mail(mail_subject,plain_message,from_email,[to_email,],html_message=message,)
        data['status'] = "disapproved"

    return JsonResponse(data)

        


    


@user_passes_test(is_admin,login_url='signin')
def event(request):
    events = Event.objects.all()
    unread_message_count  = Message.unread_count(request.user)
    inbox_count = Chat.unread_count(request.user)

    return render(request,'portal_admin/event/event_list.html',{'is_admin':True,'events':events,'unread_message_count':unread_message_count,'inbox_count':inbox_count,})


@user_passes_test(is_admin,login_url='signin')
def view_event(request,pk):
    event = Event.objects.get(id=pk)

    unread_message_count  = Message.unread_count(request.user)
    inbox_count = Chat.unread_count(request.user)

    return render(request,'portal_admin/event/view_event.html',{'is_admin':True,'event':event,'unread_message_count':unread_message_count,'inbox_count':inbox_count})

def create_event(request):
    data = dict()
    if request.method == "POST":
        form =  Event_Form(request.POST, request=request )

        if form.is_valid():
            form.save()
            data['valid'] = True
            events = Event.objects.all()
            data['html'] = render_to_string('portal_admin/event/event.html', { 'events': events,  })
        else:
            data['form'] = render_to_string('portal_admin/event/form.html', { 'form': form, 'operation': 'Add', })

    else:
        form = Event_Form(request=request)

        data['form'] = render_to_string('portal_admin/event/form.html', { 'form': form, 'operation': 'Add', })


    return JsonResponse(data)




def edit_event(request,pk):
    data = dict()
    event = Event.objects.get(id=pk)
    if request.method == "POST":
        form =  Event_Form(request.POST, request=request, instance=event )

        if form.is_valid():
            form.save()
            data['valid'] = True
            events = Event.objects.all()
            data['html'] = render_to_string('portal_admin/event/event.html', { 'events': events,  })
        else:
            data['form'] = render_to_string('portal_admin/event/form.html', { 'form': form, 'operation': 'Update','pk':pk, })

    else:
        form = Event_Form(request=request, instance=event)

        data['form'] = render_to_string('portal_admin/event/form.html', { 'form': form, 'operation': 'Update','pk':pk, })


    return JsonResponse(data)



def delete_event(reqyest,pk):
    pass

@user_passes_test(is_admin,login_url='signin')
def view_submission(request,type,pk):
    registration = Registration.objects.get(id=pk)
    unread_message_count  = Message.unread_count(request.user)
    inbox_count = Chat.unread_count(request.user)

    return render(request,'portal_admin/event/view_submission.html',{'is_admin':True,'registration':registration,'unread_message_count':unread_message_count,'inbox_count':inbox_count})


            

    

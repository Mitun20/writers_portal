from django.shortcuts import render
from django.template.loader import render_to_string
from django.http import  JsonResponse
from .forms import Call_Form, Pitch_Form, Report_Form
from .models import Post, Comment, Interest, Message
from django.db.models import Q
from account.models import Genre, User,Project, UserFollowing, Format, Language, Open_To, Chat
from itertools import chain
from account.forms import Project_Form
from django.contrib.auth.models import Group
import ast
from django.db.models import Case, When
from django.contrib.auth.decorators import login_required
import datetime
from django.db.models import Count, Q
from django.shortcuts import redirect
from django.core.mail import send_mail
from django.utils.html import strip_tags
from django.contrib.sites.shortcuts import get_current_site
from django.views.decorators.csrf import csrf_exempt
from PIL import Image
from event.models import Registration, Event
# Create your views here.


@login_required(login_url='signin')
def home(request):
    user = request.user
    is_profile_completed = User.profile_completion_check(user_id=user.id)
    recent_peoples = User.objects.order_by('-id').exclude(id=request.user.id)[:5]  
    followings =UserFollowing.objects.filter(user=user).values_list('following_user_id', flat=True)
    is_producer = None
    is_writer = None
    is_director = None
    unread_message_count = Message.unread_count(request.user)
    inbox_count = Chat.unread_count(request.user)
    top_directors = User.objects.filter(groups__name="Director")[:10]
    available_events = Event.objects.filter(Q(registration__user=request.user,registration__language__isnull=True), open_date__lte=datetime.date.today(), close_date__gte=datetime.date.today())

    for group in user.groups.all():
        if group.name  == "Writer":
            is_writer = True
        elif group.name  == "Producer":
            is_producer = True
        elif group.name  == "Director":
            is_director = True
        elif group.name  == "Admin":
            return redirect('portal_admin/')

    if is_director or is_producer:
        posts =  Post.activerecentposts.filter(Q(call__expiry_date__gte=datetime.date.today()) | Q(pitch__isnull=False,pitch__pitch_to_people__isnull=True) | Q(pitch__pitch_to_people=request.user) | Q(award__isnull=False) |  Q(assistant__isnull=False)  | Q(project__isnull=False)).distinct()
    else:
        posts = Post.recentposts.filter().exclude(Q(post_category="T") | Q(call__expiry_date__lt=datetime.date.today()))

    
    
    project_form = Project_Form(request=request) 


    context = {
        'call_form': Call_Form(request=request),
        'pitch_form' : Pitch_Form(request=request),  
        'posts' : posts,   
        'recent_peoples':recent_peoples, 
        'is_writer':is_writer ,
        'is_producer': is_producer,
        'is_director':is_director,
        'unread_message_count':unread_message_count,
        'project_form':project_form,
        'inbox_count':inbox_count,
        'top_directors':top_directors,
        'is_profile_completed':is_profile_completed ,
        'available_events':available_events,
    }

    return render(request,'home.html',context)

@csrf_exempt
def project_search(request,model_name):
    if request.method == "POST":
        data = dict()
        name = request.POST['name']
        projects = Project.objects.filter(title__icontains=name)
        data['projects'] = render_to_string('project/projects_list.html',{'projects':projects,'project_name':name,},request)
        return JsonResponse(data)

@login_required(login_url='/signin/')
def ajax_add(request,model_name):
    data = dict()

    if model_name == "call":
        if request.method == "POST":
            form =  Call_Form(request.POST,request=request)
            if form.is_valid():
                genres = form.cleaned_data['genre']
                languages = form.cleaned_data['language']
                call = form.save(commit=False)
                call.owner = request.user              
                call.save()
                for genre in genres:
                    genre = Genre.objects.get(name=genre)
                    call.genre.add(genre.id) 

                for language in languages:
                    language = Language.objects.get(language=language)
                    call.language.add(language.id) 


                data['valid']= True
                data['postid'] = call.post.id
         
            else:                
                data['valid']= False
    elif model_name == "pitch":
        if request.method == "POST":
            form =  Pitch_Form(request.POST, request.FILES,request=request)

            if form.is_valid():
                genres = form.cleaned_data['genre']
                languages = form.cleaned_data['language']
                users =request.POST['pitch_to_people']
                users = users.split(",")
                pitch = form.save(commit=False)
                pitch.owner = request.user    
                if form.cleaned_data['cover_image']:
                    x = float(request.POST.get('x'))
                    y = float(request.POST.get('y'))
                    w = float(request.POST.get('width'))
                    h = float(request.POST.get('height'))
                    files = request.FILES
                    image_file = files.get('cover_image', None)
                    image = Image.open(image_file)              
                    cropped_image = image.crop((x, y, w+x, h+y))
                    resized_image = cropped_image.resize((500, 500), Image.ANTIALIAS)
                        
                    pitch.save()
                    resized_image.save(pitch.cover_image.path) 
                else:
                    pitch.save()                
               
                for genre in genres:
                    genre = Genre.objects.get(name=genre)
                    pitch.genre.add(genre.id) 

                for language in languages:                    
                    language = Language.objects.get(language=language)
                    pitch.language.add(language.id) 

       
                for user in users:
                    try:
                        user = User.objects.get(id=user)
                        pitch.pitch_to_people.add(user.id)
                        
                        if user.get_notification:               
                            mail_subject = 'You got a New Story'    
                            current_site = get_current_site(request)              
                            message = render_to_string('mail/pitch.html', {
                                'pitch' : pitch,
                                'created_by' : request.user,
                                'domain':current_site,
                        
                            })
                            plain_message = strip_tags(message)
                            to_email = user.email
                            from_email = "Screen Writers"
                            send_mail(mail_subject,plain_message,from_email,[to_email,],html_message=message,)
                                    
                

                    except:
                        pass     


                data['valid']= True
                data['postid'] = pitch.post.id
         
            else:                
                data['valid']= False

    return JsonResponse(data)

@csrf_exempt
def pitch_user_search(request):
    data = dict()
    name = request.POST['name']   
    exclude_user = request.POST.getlist('exclude_user[]')
    exclude_user = [int(i) for i in exclude_user]
    exclude_user.append(request.user.id)
    if name:
        try:
            people_type = request.POST['people_type']
            users = User.objects.filter(Q(last_name__icontains=name) | Q(first_name__icontains=name),groups__name=people_type).distinct().exclude(Q(id__in=exclude_user))
        except:
            users = User.objects.filter(Q(last_name__icontains=name,groups__name__in=('Producer','Director')) | Q(first_name__icontains=name,groups__name__in=('Producer','Director'))).distinct().exclude(id__in=exclude_user)
        
    else:
        try:
            people_type = request.POST['people_type']
            users = User.objects.filter(groups__name=people_type).distinct().exclude(Q(id__in=exclude_user))[:20]
        except:
            users = User.objects.filter(groups__name__in=('Producer','Director')).distinct().exclude(id__in=exclude_user)[:20]
    
    data['users'] = render_to_string('project/user_list.html',{'users':users,'senior_name':name,},request)
    return JsonResponse(data)    

@login_required(login_url='/signin/')
def ajax_like_unlike(request,pk):
    data =  dict()    
    post = Post.objects.get(id=pk)
    like_count = post.get_like_count
    post = Post.like_or_unlike(self=post,user=request.user)
    if post:
        data['liked'] = True
        data['like_count'] = int(like_count)+1
    else:
        data['like_count'] = int(like_count)-1

    return JsonResponse(data)


@login_required(login_url='/signin/')
def ajax_comment(request,pk):
    data= dict()
    if request.method == "POST":
        comment = request.POST.get('comment')
        post = Post.objects.get(id=pk)        
        comment = Comment.objects.create(commented_by=request.user,post=post,comment=comment)
        comment_count = post.get_comment_count
        data['valid'] =  True
        data['html'] = render_to_string('project/comments.html',{'post':post},request)
        data['comment_count'] = comment_count


    else:
        data['valid'] =  False 

    return JsonResponse(data)
    
@login_required(login_url='/signin/')
def ajax_delete_comment(request,pk):
    data= dict()
    comment= Comment.objects.get(id=pk)    

    if comment.commented_by == request.user:
        post= comment.post.id
        comment.delete()
        post = Post.objects.get(id=post)
        data['valid'] =  True
        data['html']  = render_to_string('project/comments.html',{'post':post},request)
        data['comment_count'] = str(post.get_comment_count)
        data['post_id'] = post.id

    else:
        data['valid'] =  False 

    return JsonResponse(data)

@login_required(login_url='/signin/')
def interest(request,pk):
    data = dict()
    post= Post.objects.get(id=pk)
    try:
        interest = Interest.objects.get(post=post,shown_by=request.user)
        make_read =  Message.objects.exclude(message_by=request.user).filter(interest=interest).update(unread=False)
    except:
        interest = None

    data['valid'] =  True
    data['html']  = render_to_string('project/interest.html',{'post':post,'interest':interest},request)
    return JsonResponse(data)

@login_required(login_url='/signin/')
def message(request,pk):
    data= dict()
    message = request.POST['message']
    files = request.FILES
    message_file = files.get('message-file', None)
    msg_type = "interest"

    if message_file:
        message = Message(message_by=request.user,message=message,m_file=message_file)
    else:
        message = Message(message_by=request.user,message=message)

    message.save(post_id=pk,shown_by=request.user,msg_type=msg_type,message_by=request.user)
    interest=message.interest
    make_read =  Message.objects.exclude(message_by=request.user).filter(interest=interest).update(unread=False)
    data['message']  = render_to_string('project/message.html',{'interest':interest},request)
    data['valid'] = True
    return JsonResponse(data)


@login_required(login_url='/signin/')
def post_detail(request,pk):
    data= dict()
    post = Post.objects.get(id=pk)
    user = request.user
    is_producer = None
    is_writer = None
    is_director = None

    for group in user.groups.all():
        if group.name  == "Writer":
            is_writer = True
        elif group.name  == "Producer":
            is_producer = True
        elif group.name  == "Director":
            is_director = True
    data['post']  = render_to_string('project/post_detail.html',{'post':post,'is_producer':is_producer,'is_writer':is_writer,'is_director':is_director,},request)
    return JsonResponse(data)


@login_required(login_url='/signin/')
def response(request,pk):
    data =  dict()
    user = request.user
    post = Post.objects.get(id=pk)
    if post.posted_by() == user:
        
        interests = Interest.objects.filter(post=post)
        #make_read =  Message.objects.exclude(message_by=request.user).filter(interest=interest).update(unread=False)
        data['responses']  = render_to_string('project/responses.html',{'interests':interests,'post':post,},request)

        data['valid'] = True

    else:
        data['valid'] = False
        data['response'] = "Access Denied.."

    return JsonResponse(data)

@login_required(login_url='/signin/')
def view_message(request,pk):
    data= dict()    
    interest = Interest.objects.get(id=pk)
    if interest.post.posted_by() == request.user:
        make_read =  Message.objects.exclude(message_by=request.user).filter(interest=interest).update(unread=False)
        data['message']  = render_to_string('project/view_message.html',{'interest':interest,'post':interest.post,},request)
        data['valid'] = True

    else:
        data['valid'] = False
    
    return JsonResponse(data)



@login_required(login_url='/signin/')
def reply_to_a_message(request,pk):
    data= dict()
    message = request.POST['intrest_message_txt']
    files = request.FILES
    message_file = files.get('message-file', None)
    interest= Interest.objects.get(id=pk) 
    if interest.post.posted_by() == request.user:

        if message_file:
            message = Message(message_by=request.user,message=message,m_file=message_file)
        else:
            message = Message(message_by=request.user,message=message)

        msg_type = "interest"
        message.save(post_id=interest.post.id,shown_by=interest.shown_by,msg_type=msg_type,message_by=request.user)
        make_read =  Message.objects.exclude(message_by=request.user).filter(interest=interest).update(unread=False)
        data['message']  = render_to_string('project/view_message.html',{'interest':interest},request)
        data['valid'] = True
    else:
        data['valid'] = False
        data['response']  = "Access Denied..!"
    return JsonResponse(data)


@login_required(login_url='/signin/')
def report_post(request,pk):
    post =  Post.objects.get(id=pk)
    data = dict()
    if request.method == "POST":
        form = Report_Form(request.POST,request=request)

        if form.is_valid():
            report = form.save(commit=False)
            report.post = post
            report.reported_by = request.user
            report.save()
            data['valid'] = True
        else:            
            data['form']  = render_to_string('project/report_post.html',{'form':form,'post':post,},request)
            data['valid'] = False
      

    else:
        form = Report_Form(request=request)
        data['form']  = render_to_string('project/report_post.html',{'form':form,'post':post,},request)
        data['valid'] = True

    return JsonResponse(data)

@login_required(login_url='signin')
def view_opportunities(request):
    user= request.user
    is_producer = None
    is_writer = None
    is_director = None

    unread_message_count  = Message.unread_count(request.user)
    inbox_count = Chat.unread_count(request.user) 


    for group in user.groups.all():
        if group.name  == "Writer":
            is_writer = True
        elif group.name  == "Producer":
            is_producer = True
        elif group.name  == "Director":
            is_director = True
    user_languages = user.languages_to_work.all()
    user_formats = user.interested_format.all()
    user_genres = user.specialization_of_genre.all()

    posts = Post.oposts.filter(Q(call__language__in=user_languages,call__expiry_date__gte=datetime.date.today()) | Q(call__format__in=user_formats,call__expiry_date__gte=datetime.date.today()) | Q(call__genre__in=user_genres,call__expiry_date__gte=datetime.date.today())).distinct()
    if not posts:
        posts = Post.activerecentposts.filter(call__expiry_date__gte=datetime.date.today(),active=True)[:10]
    genres = Genre.objects.all()
    formats = Format.objects.all()
    languages = Language.objects.all() 
    requirements = Open_To.objects.all()
    groups = Group.objects.filter(name__in=('Producer','Director'))
    recent_peoples = User.objects.order_by('-id').exclude(id=request.user.id)[:5]  
    project_form = Project_Form(request=request)

    context = {
        'is_producer':is_producer,
        'is_writer':is_writer,
        'is_director':is_director,
        'groups':groups,
        'posts':posts,
        'genres':genres,
        'formats':formats,
        'languages':languages,
        'requirements':requirements,
        'recent_peoples':recent_peoples,
        'project_form':project_form,
        'unread_message_count':unread_message_count,
        'inbox_count':inbox_count,
    }

    return render(request,'view_opportunities.html',context)


@login_required(login_url='/signin/')
def post_filter(request):
    user= request.user
    is_producer = None
    is_writer = None
    is_director = None

    for group in user.groups.all():
        if group.name  == "Writer":
            is_writer = True
        elif group.name  == "Producer":
            is_producer = True
        elif group.name  == "Director":
            is_director = True
    if request.method == "POST":
        data=dict()
        genres =[ast.literal_eval(i) for i in request.POST.getlist('genre')] 
        formats =[ast.literal_eval(i) for i in request.POST.getlist('format')]
        languages =[ast.literal_eval(i) for i in request.POST.getlist('language')]
        requirements =[ast.literal_eval(i) for i in request.POST.getlist('requirement')]
        groups =[ast.literal_eval(i) for i in request.POST.getlist('group')]
        posts = Post.oposts.all().distinct()

        if genres:
            posts =  posts.filter(call__genre__in=genres,call__expiry_date__gte=datetime.date.today()).distinct()
        if formats:
            posts = posts.filter(call__format__in=formats,call__expiry_date__gte=datetime.date.today()).distinct()
        if languages:
            posts = posts.filter(call__language__in=languages,call__expiry_date__gte=datetime.date.today()).distinct()
        if requirements:
            posts = posts.filter(call__call_for__in=requirements,call__expiry_date__gte=datetime.date.today()).distinct()
        if groups:
            posts = posts.filter(call__owner__groups__in=groups,call__expiry_date__gte=datetime.date.today()).distinct()

        data['html'] = render_to_string('project/posts.html',{'posts':posts,'is_producer':is_producer,'is_director':is_director,'is_writer':is_writer,},request)
        data['valid'] = True

    else:
        data['valid'] = False

    return JsonResponse(data)

@login_required(login_url='signin')
def view_matching_stories(request):
    user= request.user
    is_producer = None
    is_writer = None
    is_director = None
    unread_message_count  = Message.unread_count(request.user)
    inbox_count = Chat.unread_count(request.user) 


    for group in user.groups.all():
        if group.name  == "Writer":
            is_writer = True
        elif group.name  == "Producer":
            is_producer = True
        elif group.name  == "Director":
            is_director = True
    user_languages = user.languages_to_work.all()
    user_formats = user.interested_format.all()
    user_genres = user.specialization_of_genre.all()

    posts = Post.tposts.filter(Q(pitch__language__in=user_languages,pitch__pitch_to_people__isnull=True) | Q(pitch__format__in=user_formats,pitch__pitch_to_people__isnull=True) | Q(pitch__genre__in=user_genres,pitch__pitch_to_people__isnull=True) | Q(pitch__language__in=user_languages,pitch__pitch_to_people=request.user) | Q(pitch__format__in=user_formats,pitch__pitch_to_people=request.user) | Q(pitch__genre__in=user_genres,pitch__pitch_to_people=request.user) ).distinct()
    genres = Genre.objects.all()
    formats = Format.objects.all()
    languages = Language.objects.all() 
    requirements = Open_To.objects.all()
    groups = Group.objects.filter(name__in=('Producer','Director'))
    recent_peoples = User.objects.order_by('-id').exclude(id=request.user.id)[:5]  

    context = {
        'is_producer':is_producer,
        'is_writer':is_writer,
        'is_director':is_director,
        'groups':groups,
        'posts':posts,
        'genres':genres,
        'formats':formats,
        'languages':languages,
        'requirements':requirements,
        'recent_peoples':recent_peoples,
        'unread_message_count':unread_message_count,
        'inbox_count':inbox_count,
        
    }

    return render(request,'view_matching_stories.html',context)


@login_required(login_url='/signin/')
def story_post_filter(request):
    user= request.user
    is_producer = None
    is_writer = None
    is_director = None

    for group in user.groups.all():
        if group.name  == "Writer":
            is_writer = True
        elif group.name  == "Producer":
            is_producer = True
        elif group.name  == "Director":
            is_director = True

    if request.method == "POST":
        data=dict()
        genres =[ast.literal_eval(i) for i in request.POST.getlist('genre')] 
        formats =[ast.literal_eval(i) for i in request.POST.getlist('format')]
        languages =[ast.literal_eval(i) for i in request.POST.getlist('language')]
        requirements =[ast.literal_eval(i) for i in request.POST.getlist('requirement')]
        groups =[ast.literal_eval(i) for i in request.POST.getlist('group')]
        posts = Post.tposts.filter(Q(pitch__pitch_to_people__isnull=True) | Q(pitch__pitch_to_people=request.user)).distinct()

        if genres:
            posts = posts.filter(pitch__genre__in=genres).distinct()
        if formats:
            posts = posts.filter(pitch__format__in=formats).distinct()
        if languages:
            posts = posts.filter(pitch__language__in=languages).distinct()
        if requirements:
            posts = posts.filter(pitch__call_for__in=requirements).distinct()
        if groups:
            posts = posts.filter(pitch__owner__groups__in=groups).distinct()

        data['html'] = render_to_string('project/posts.html',{'posts':posts,'is_producer':is_producer,'is_director':is_director,'is_writer':is_writer,},request)
        data['valid'] = True

    else:
        data['valid'] = False

    return JsonResponse(data)

@login_required(login_url='signin')
def my_activity(request):
    user= request.user
    is_producer = None
    is_writer = None
    is_director = None
    is_admin = False
    recent_peoples = User.objects.order_by('-id').exclude(id=request.user.id)[:5] 
    unread_message_count = Message.unread_count(request.user) 
    inbox_count = Chat.unread_count(request.user)

    for group in user.groups.all():
        if group.name  == "Writer":
            is_writer = True
        elif group.name  == "Producer":
            is_producer = True
        elif group.name  == "Director":
            is_director = True
        elif group.name  == "Admin":
            is_admin = True


    posts = Post.wallposts.filter((Q(call__owner=user) | Q(pitch__owner=user) | Q(interest__shown_by=user))).order_by('-date').distinct()


    context={
        'is_admin': is_admin,
        'is_producer':is_producer,
        'is_writer':is_writer,
        'is_director':is_director,
        'posts':posts,
        'recent_peoples':recent_peoples,
        'unread_message_count':unread_message_count,
        'inbox_count':inbox_count,
    }
    return render(request,'my_activity.html',context)


@login_required(login_url='/signin/')
def my_activity_filter(request):
    data = dict()
    user= request.user
    is_producer = None
    is_writer = None
    is_director = None
    is_admin = False

    for group in user.groups.all():
        if group.name  == "Writer":
            is_writer = True
        elif group.name  == "Producer":
            is_producer = True
        elif group.name  == "Director":
            is_director = True

        elif group.name  == "Admin":
            is_admin = True

    if request.method == "POST":
        data=dict()
        my_post = request.POST.get('is_my_post')
        my_interest = request.POST.get('is_my_interest')
        my_pitch = request.POST.get('is_my_pitch')
        my_call = request.POST.get('is_my_call')
        from_date =  request.POST.get('from_date')
        to_date = request.POST.get('to_date')  

        posts = Post.wallposts.filter((Q(call__owner=user) | Q(pitch__owner=user) | Q(interest__shown_by=user))).order_by('-date').distinct()

        if my_interest and my_pitch and not my_call:
            posts  = posts.filter(Q(interest__shown_by=user) | Q(pitch__owner=user)).distinct().order_by('-date')
       
        if my_interest and my_call and not my_pitch:
            posts  = posts.filter(Q(interest__shown_by=user) | Q(call__owner=user)).distinct().order_by('-date')

        if my_pitch and my_call and not my_interest:
            posts  = posts.filter(Q(pitch__owner=user) | Q(call__owner=user)).distinct().order_by('-date')


        if my_interest and not my_pitch and not my_call:
            posts  = posts.filter(interest__shown_by=user).distinct().order_by('-date')
        if my_pitch and not my_interest and not my_call:
            posts  = posts.filter(pitch__owner=user).distinct().order_by('-date')    
        if my_call and not my_interest and not my_pitch:
            posts = posts.filter(call__owner=user).distinct().order_by('-date')
        if from_date:            
            posts = posts.filter(date__gte=from_date).distinct().order_by('-date')
            
        if to_date:
            posts = posts.filter(date__lte=to_date).distinct().order_by('-date')


        data['html'] = render_to_string('project/posts_close.html',{'posts':posts,'is_producer':is_producer,'is_director':is_director,'is_writer':is_writer,'is_admin':is_admin,},request)
        data['valid'] = True

    else:
        data['valid'] = False

    return JsonResponse(data)


@login_required(login_url='/signin/')
def home_post_filter(request):
    data = dict()
    user= request.user
    is_producer = None
    is_writer = None
    is_director = None

    for group in user.groups.all():
        if group.name  == "Writer":
            is_writer = True
        elif group.name  == "Producer":
            is_producer = True
        elif group.name  == "Director":
            is_director = True

    if request.method == "POST":
        post_filter_type =request.POST.get('post_filter_type')
        
        if post_filter_type == "is_i_follow":
            followings =UserFollowing.objects.filter(user=user).values_list('following_user_id', flat=True)
            if is_director or is_producer:
                posts =  Post.activerecentposts.filter(Q(call__owner__id__in=followings,call__expiry_date__gte=datetime.date.today()) | Q(pitch__owner__id__in=followings,pitch__pitch_to_people__isnull=True) | Q(pitch__owner__id__in=followings,pitch__pitch_to_people=request.user) | Q(award__user__id__in=followings) |  Q(assistant__user__id__in=followings)  | Q(project__created_by__id__in=followings)).distinct()
            else:                
                posts =  Post.activerecentposts.filter(Q(call__owner__id__in=followings,call__expiry_date__gte=datetime.date.today())  | Q(award__user__id__in=followings) |  Q(assistant__user__id__in=followings)  | Q(project__created_by__id__in=followings)).distinct()
        

        elif post_filter_type == "is_recent_all":
            if is_director or is_producer:
                posts =  Post.activerecentposts.filter(Q(call__expiry_date__gte=datetime.date.today()) | Q(pitch__isnull=False,pitch__pitch_to_people__isnull=True) | Q(pitch__pitch_to_people=request.user) | Q(award__isnull=False) |  Q(assistant__isnull=False)  | Q(project__isnull=False)).distinct()
               
            else:
                posts = Post.recentposts.filter().exclude(Q(post_category="T") | Q(call__expiry_date__lt=datetime.date.today()))

        elif post_filter_type == "is_most_liked":
            if is_director or is_producer:
                today = datetime.date.today()
                ninty_days_ago = today - datetime.timedelta(days=90)               
                posts = Post.objects.filter(Q(call__expiry_date__gte=datetime.date.today()) | Q(pitch__isnull=False,pitch__pitch_to_people__isnull=True) | Q(pitch__pitch_to_people=request.user) | Q(award__isnull=False) |  Q(assistant__isnull=False)  | Q(project__isnull=False),date__gte=ninty_days_ago).annotate(top=Count('upvote__id')).order_by('-top','-date') 
            else:
                today = datetime.date.today()
                ninty_days_ago = today - datetime.timedelta(days=90)
                posts = Post.objects.filter(Q(call__expiry_date__gte=datetime.date.today()) | Q(award__isnull=False) |  Q(assistant__isnull=False)  | Q(project__isnull=False),date__date__gte=ninty_days_ago).annotate(top=Count('upvote__id')).exclude(Q(post_category="T")).order_by('-top','-date') [0:100]


        elif post_filter_type == "is_my_interest":
            user_languages = user.languages_to_work.all()
            user_formats = user.interested_format.all()
            user_genres = user.specialization_of_genre.all()
            if is_director or is_producer:                
                posts  = Post.recentposts.filter(Q(pitch__language__in=user_languages,pitch__pitch_to_people__isnull=True) | Q(pitch__format__in=user_formats,pitch__pitch_to_people__isnull=True) | Q(pitch__genre__in=user_genres,pitch__pitch_to_people__isnull=True) | Q(pitch__language__in=user_languages,pitch__pitch_to_people=request.user) | Q(pitch__format__in=user_formats,pitch__pitch_to_people=request.user) | Q(pitch__genre__in=user_genres,pitch__pitch_to_people=request.user) | Q(call__language__in=user_languages,call__expiry_date__gte=datetime.date.today()) | Q(call__format__in=user_formats,call__expiry_date__gte=datetime.date.today()) | Q(call__genre__in=user_genres,call__expiry_date__gte=datetime.date.today())).distinct()  
            else:
                posts  = Post.recentposts.filter(Q(call__language__in=user_languages,call__expiry_date__gte=datetime.date.today()) | Q(call__format__in=user_formats,call__expiry_date__gte=datetime.date.today()) | Q(call__genre__in=user_genres,call__expiry_date__gte=datetime.date.today())).distinct()

        data['html'] = render_to_string('project/posts.html',{'posts':posts,'is_producer':is_producer,'is_director':is_director,'is_writer':is_writer,},request)
        data['valid'] = True

    return JsonResponse(data)



@login_required(login_url='/signin/')
def post_active_close(request,pk):
    data =  dict()    
    post = Post.objects.get(id=pk)

    if not post.posted_by == request.user:
        data['valid'] = False
        data['response'] = "Access Denied..!"

    if post.active:
        post.active = False
        post.save()
        data['active'] = False
    else:
        post.active = True
        post.save()
        data['active'] = True

    data['valid'] = True


    is_producer = None
    is_writer = None
    is_director = None

    for group in request.user.groups.all():
        if group.name  == "Writer":
            is_writer = True
        elif group.name  == "Producer":
            is_producer = True
        elif group.name  == "Director":
            is_director = True

    data['html'] =  render_to_string('project/post_open_close.html',{'post':post,'is_producer':is_producer,'is_director':is_director,'is_writer':is_writer,},request)
    return JsonResponse(data)

@login_required(login_url='/signin/')
def upvote_downvote(request,pk,action):
    data = dict()
    post = Post.objects.get(id=pk)
    action = Post.upvote_or_downvote(self=post,user=request.user,action=action)
    data['action'] = action
    downvote_count = post.get_downvote_count()
    data['upvote_count'] = post.get_upvote_count()
    data['downvote_count'] = downvote_count
    if downvote_count  > 20:
        post.delete()
    return JsonResponse(data)
from django.shortcuts import render
from .models import Club_House
# Create your views here.


def club_house(request):
    clubhouses = Club_House.objects.filter(admin=request.user)
    print(clubhouses)
   
    context = {
        'clubhouses': clubhouses,
       
    }

    return render(request,'club_house/home.html',context)
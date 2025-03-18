from django.urls import path
from . import views

urlpatterns = [
    path('club_house/',views.club_house, name="club_house"),    
]

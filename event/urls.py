from django.urls import path
from . import views

urlpatterns = [
    path('event-registration/<slug:slug>',views.event_signup, name="event-registration"),   
    path('registered_successfully/',views.registered, name="registered_successfully"),
    path('event_registration/<slug:slug>',views.event_registration, name="event_registration"),  
    path('submitted_successfully/',views.submitted, name="submitted_successfully"), 
]

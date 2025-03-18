from django.urls import path
from . import views
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('signup/',views.signup, name="signup"),  
    path('signup/',views.signup, name="login"), 
    path('activate/<slug:uidb64>/<slug:token>/',views.activate_account, name='activate'),
    path('registered-successfully/',views.registered, name="registered-successfully"),
    path('signin/',views.CustomLoginView.as_view(), name='signin',kwargs={'redirect_authenticated_user': True}),    
    path('signup/',views.signup, name="home"), 
    path('edit_profile/',views.edit_profile, name="edit_profile"),
    path('my_profile/',views.my_profile, name="my_profile"),
    path('profile/<int:pk>',views.profile, name="profile"),
    path('following/',views.following, name="following"),
    path('followers/',views.followers, name="followers"),
    path('all_peoples/',views.all_peoples, name="all_peoples"),
    path('logout/',views.logout, name="logout"),
    path('people_search/',views.people_search, name="people_search"),
    path('report_people/<int:pk>',views.report_people, name="report_people"),
    
    path('ajax_add_as_assistant/',views.ajax_add_as_assistant, name="ajax_add_as_assistant"),
    path('as_assistant_edit/<int:pk>/',views.as_assistant_edit, name="as_assistant_edit"),
    path('person_search/',views.person_search, name="person_search"),
        
    path('ajax_add/<str:model_name>/',views.ajax_add, name="ajax_add"),
    path('ajax_edit/<str:model_name>/<int:pk>/',views.ajax_edit, name="ajax_edit"),
    path('ajax_delete/<str:model_name>/<int:pk>/',views.ajax_delete, name="ajax_delete"),


    path('follow_unfollow/<int:pk>/',views.ajax_follow_unfollow, name="follow_unfollow"),
    path('search_people/',views.search_people, name="search_people"),

    path('write-testimonial/<int:pk>/',views.write_testimonial, name="write-testimonial"),
    path('search/',views.search, name="search"),

    path('people_rating/<int:user>/<int:rate>/',views.people_rating, name="people_rate"),

    path('get_all_message/<int:user>/',views.get_all_message, name="get_all_message"),

    path('message_to/<int:user>/',views.message_to, name="message_to"),
    path('inbox/',views.inbox, name="inbox"),

    path('get_inbox_chat/<int:user>/',views.get_inbox_chat, name="get_inbox_chat"),
    path('chat_to/<int:user>/',views.chat_to, name="chat_to"),


    path('block_unblock/<int:pk>/',views.ajax_block_unblock, name="block_unblock"),
    
    
    
    path('reset_password/', views.reset_password, name ='reset_password'),
    path('reset_password_form/', views.reset_password_form, name ='reset_password_form'),
    path('reset_password_sent/', auth_views.PasswordResetDoneView.as_view(template_name = "registration/password_reset_sent.html"), name ='password_reset_done'),
    path('reset/<uidb64>/<token>', auth_views.PasswordResetConfirmView.as_view(template_name = "registration/password_reset_form.html"), name ='password_reset_confirm'),
    path('reset_password_complete/', auth_views.PasswordResetCompleteView.as_view(template_name = "registration/password_reset_done.html"), name ='password_reset_complete'),


    path('ajax_project_highlight/<int:pk>/',views.ajax_project_highlight, name="ajax_project_highlight"),



    path('change_password/',views.change_password, name="change_password"),

    path('privacy-policy/',views.privacy_policy, name="privacy-policy"),
    path('terms-conditions/',views.terms_conditions, name="terms-conditions"),

    path('otp_validate/',views.otp_validate, name="otp_validate"),
    path('generate-otp/',views.generate_otp, name="generate-otp"),
    path('otp_session_remove/',views.otp_session_remove, name="otp_session_remove"),

    path('view_my_submission/<int:pk>',views.view_my_submission, name="view_my_submission"),

    path('change_mobile_number/',views.change_mobile_number, name="change_mobile_number"),
    path('generate_otp_for_change_mobile_number/',views.generate_otp_for_change_mobile_number, name="generate_otp_for_change_mobile_number"),
   
    
]
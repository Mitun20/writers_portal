from django.urls import path
from . import views

urlpatterns = [

    path('',views.home, name="home"), 
    path('project_search/<str:model_name>/',views.project_search, name="project_search"),
    path('projectapp_ajax_add/<str:model_name>/',views.ajax_add, name="projectapp_ajax_add"),
    path('pitch-user-search/',views.pitch_user_search, name="pitch-user-search"),
    path('like_unlike/<int:pk>/',views.ajax_like_unlike, name="like_unlike"),
    path('comment/<int:pk>/',views.ajax_comment, name="comment"),
    path('delete_comment/<int:pk>/',views.ajax_delete_comment, name="delete_comment"),
    path('interest/<int:pk>/',views.interest, name="interest"),
    path('response/<int:pk>/',views.response, name="response"),
    path('message/<int:pk>/',views.message, name="message"),
    path('post-detail/<int:pk>/',views.post_detail, name="post-detail"),
    path('view-message/<int:pk>/',views.view_message, name="view-message"),
    path('reply-to-a-message/<int:pk>/',views.reply_to_a_message, name="reply-to-a-message"),
    path('report-post/<int:pk>/',views.report_post, name="report-post"),

    path('upvote_downvote/<int:pk>/<str:action>/',views.upvote_downvote, name="upvote_downvote"),


    path('view_opportunities/',views.view_opportunities, name="view_opportunities"),
    path('view_matching_stories/',views.view_matching_stories, name="view_matching_stories"),
    path('post_filter/',views.post_filter, name="post_filter"),
    path('story_post_filter/',views.story_post_filter, name="story_post_filter"),
    

    path('my_activity/',views.my_activity, name="my_activity"),
    path('my_activity_filter/',views.my_activity_filter, name="my_activity_filter"),

    
    path('home_post_filter/',views.home_post_filter, name="home_post_filter"),


    path('post_active_close/<int:pk>/',views.post_active_close, name="post_active_close"),


    

    
]

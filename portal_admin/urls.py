from django.urls import path
from . import views

urlpatterns = [
    path('portal_admin/',views.portal_admin, name="portal_admin"), 
    path('user_active_inactive/<int:pk>',views.user_active_inactive, name="user_active_inactive"),
    path('all_people/',views.UserListView.as_view(),name='all_people'),
    path('view_posts/',views.view_posts,name='view_posts'),
    path('post_cannot_open/<int:pk>',views.post_cannot_open, name="post_delete"),
    path('view_post/<int:pk>',views.view_post, name="view_post"),
    path('view_people_report/',views.view_people_report, name="view_people_report"),
    path('delete/<str:parent_model_name>/<int:pk>',views.ajax_delete, name="delete"),
    path('view_reported_posts/',views.ReportPostListView.as_view(),name='view_reported_posts'),
    path('view_reported_peoples/',views.ReportUserListView.as_view(),name='view_reported_peoples'),
    path('statistics/<int:pk>',views.statistics, name="statistics"),
    path('portal_admin_home_filter/',views.portal_admin_home_filter, name="portal_admin_home_filter"),
    path('skip_all_reports/<str:model>/<int:pk>',views.skip_all_reports, name="skip_all_reports"),
    path('fetch/<str:model>/<int:pk>',views.ajax_fetch, name="fetch"),

    path('report/',views.report, name="report"),
    path('portal_admin_report_filter/',views.portal_admin_report_filter, name="portal_admin_report_filter"),
    
    path('portal_people_search/',views.people_search, name="portal_people_search"),

    

    path('draw/',views.draw_usage, name="draw_usage"),
    path('draw_chart/',views.draw_chart, name="draw_chart"),

    path('admin-approve/<int:pk>/<str:action>/',views.admin_approve, name="admin-approve"),

    path('event/',views.event, name="event"),
    path('view_event/<int:pk>',views.view_event, name="view_event"),
    path('create_event/',views.create_event, name="create_event"),
    path('edit_event/<int:pk>',views.edit_event, name="edit_event"),
    path('delete_event/<int:pk>',views.delete_event, name="delete_event"),
    path('view_submission/<str:type>/<int:pk>',views.view_submission, name="view_submission"),


    
]


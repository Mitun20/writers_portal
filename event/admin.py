from django.contrib import admin
from .models import Event, Registration, Year_Of_Production

# Register your models here.


class EventAdmin(admin.ModelAdmin):
    list_display = ['title','open_date','close_date','script_count','video_count']

admin.site.register(Event, EventAdmin)
admin.site.register(Registration)
admin.site.register(Year_Of_Production)
from django.contrib import admin
from .models import User, Qualification,Location, Genre, Format, Language, Open_To,Assistant, Award, Highlight,Testimonial, Project,UserFollowing, Testimonial, Report_People, Company, Rating, Conversation, Chat, Blocked_User, Join_Project

# Register your models here.


class Qualification_Inline(admin.TabularInline):
    model = Qualification

class Assistant_Inline(admin.TabularInline):
    model = Assistant
    fk_name = "user"

class Award_Inline(admin.TabularInline):
    model = Award


class Testimonial_Inline(admin.TabularInline):
    model = Testimonial
    fk_name = 'user'

class UserAdmin(admin.ModelAdmin):
    list_display = ['username',]
    list_filter = ['groups',]
    inlines = [Qualification_Inline,Assistant_Inline,Award_Inline,Testimonial_Inline]


admin.site.register(User,UserAdmin)
admin.site.register(Qualification)
admin.site.register(Location)
admin.site.register(Genre)
admin.site.register(Format)
admin.site.register(Language)
admin.site.register(Open_To)
admin.site.register(Project)
admin.site.register(UserFollowing)

admin.site.register(Testimonial)
admin.site.register(Report_People)
admin.site.register(Company)
admin.site.register(Rating)
admin.site.register(Award)
admin.site.register(Blocked_User)

admin.site.register(Highlight)

class ConversationAdmin(admin.ModelAdmin):
    list_display = ['sender','receiver','date']

admin.site.register(Conversation,ConversationAdmin)
admin.site.register(Chat)


admin.site.register(Join_Project)
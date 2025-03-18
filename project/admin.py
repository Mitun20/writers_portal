from django.contrib import admin

from . models import Call, Pitch, Post, Message, Interest, Like, Comment, Upvote,Downvote

admin.site.register(Call)
admin.site.register(Pitch)
admin.site.register(Post)
admin.site.register(Message)
admin.site.register(Interest)
admin.site.register(Like)
admin.site.register(Comment)
admin.site.register(Upvote)
admin.site.register(Downvote)

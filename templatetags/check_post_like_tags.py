from django import template
from project.models import Post, Like, Upvote, Downvote, Interest, Message
from account.models import Chat

register = template.Library()

@register.simple_tag
def count_unread_chat(conversation_id,user):
    count = Chat.objects.filter(conversation__id=conversation_id,unread=True).exclude(sender=user).count()
    return count


@register.simple_tag
def count_read_chat(conversation_id,user):
    count = Chat.objects.filter(conversation__id=conversation_id,unread=False).exclude(sender=user).count()
    return count

@register.simple_tag
def count_my_unread(post_id,user):
    count = Message.objects.filter(interest__post__id=post_id,unread=True).exclude(message_by=user).count()
    return count

@register.simple_tag
def count_int_unread(post_id,user):
    interest = Interest.objects.get(post__id=post_id,shown_by=user)
    count = Message.objects.filter(interest=interest,unread=True).exclude(message_by=user).count()
    return count


@register.simple_tag
def check_interest(post_id,user):
    if Interest.objects.filter(post__id=post_id,shown_by=user).exists():
        return True
    else:
        return False

@register.simple_tag
def get_post_like_status(post_id, user):
    if Like.objects.filter(post__id=post_id,liked_by=user).exists():
        return True
    else:
        return False


@register.simple_tag
def get_post_upvote_status(post_id, user):
    if Upvote.objects.filter(post__id=post_id,upvoted_by=user).exists():
        return True
    else:
        return False


@register.simple_tag
def get_post_downvote_status(post_id, user):
    if Downvote.objects.filter(post__id=post_id,downvoted_by=user).exists():
        return True
    else:
        return False
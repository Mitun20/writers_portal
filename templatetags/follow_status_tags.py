from django import template
from account.models import UserFollowing, Report_People
from django.db.models import Q, Avg
from project.models import Message
register = template.Library()


@register.simple_tag
def get_follow_status(user_id, user):

    if UserFollowing.objects.filter(following_user_id=user_id,user=user).exists():
        return True
    else:
        return False

@register.simple_tag
def get_last_message(user_id, user):

    messages = Message.objects.filter((Q(message_by=user,message_to=user_id) | Q(message_by=user_id,message_to=user) )).order_by('-id')[:1]
    for message  in messages:
        last_msg = message.message
    return last_msg


@register.simple_tag
def get_message_count(user_id, user):
    count = Message.objects.filter((Q(message_by=user,message_to=user_id) | Q(message_by=user_id,message_to=user)),~Q(message_by=user),unread=True).count()

    return count


@register.simple_tag
def get_report_count(user_id):
    count = Report_People.objects.filter(reported_user__id=user_id).count()
    return count


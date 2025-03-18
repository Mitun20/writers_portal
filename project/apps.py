from django.apps import AppConfig
from django.utils.translation import ugettext_lazy as _


class ProjectConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'project'
    
    def ready(self):
       import project.signals
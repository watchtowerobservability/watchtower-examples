"""Single-file Django app wired with Watchtower. Run: python app.py runserver"""
import os
import sys

import watchtower
from django.conf import settings
from django.core.management import execute_from_command_line
from django.http import JsonResponse
from django.urls import path

watchtower.init(
    os.environ["WT_INGEST_KEY"],
    project=os.environ["WT_PROJECT_ID"],
    service=os.environ.get("WT_SERVICE", "django-example"),
    buffer_dir=".wt-buffer",
)

settings.configure(DEBUG=True, SECRET_KEY=os.urandom(16).hex(), ROOT_URLCONF=__name__, ALLOWED_HOSTS=["*"])


def hello(request):
    return JsonResponse({"hello": "watchtower"})


def boom(request):
    raise RuntimeError("boom from the Django example")


urlpatterns = [path("hello", hello), path("boom", boom)]

if __name__ == "__main__":
    execute_from_command_line(sys.argv)

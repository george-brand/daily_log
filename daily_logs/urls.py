"""Defines URL patterns for daily_logs."""

from django.urls import path

from . import views

app_name = 'daily_logs'
urlpatterns = [
    # Home page
    path('', views.index, name='index'),
]
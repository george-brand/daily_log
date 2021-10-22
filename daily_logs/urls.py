"""Defines URL patterns for daily_logs."""

""" Defines url patterns for daily_logs."""
from django.urls import path

from . import views

app_name = 'daily_logs'
urlpatterns = [
    # Home page
    path('', views.index, name='index'),

    # Show all topics.
    path('topics/', views.topics, name='topics'),

    # Detail page for a single topic
    path('topics/<int:topic_id>/', views.topic, name='topic'),
]
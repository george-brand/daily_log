from django.shortcuts import render

# Create your views here.

def index(request):
    """The home page for daily_log."""
    return render(request, 'daily_logs/index.html')


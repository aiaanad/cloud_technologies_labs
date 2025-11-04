from django.contrib import admin
from django.urls import path
from django.http import HttpResponse


def home_view(request):
    return HttpResponse("""
        <h1>Hello from Django in Docker!</h1>
        <p>This is a multi-container application with PostgreSQL</p>
        <a href="/admin/">Admin Panel</a>
    """)


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', home_view),
]
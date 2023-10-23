from django.urls import path
from django.views.generic import TemplateView


urlpatterns = [
    path(
        "",
        TemplateView.as_view(template_name="index.html"),
        name="index",
    ),
    path(
        "2",
        TemplateView.as_view(template_name="page_2.html"),
        name="page_2",
    ),
]
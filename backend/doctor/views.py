from django.shortcuts import render

from rest_framework import viewsets
from prescriptions.models import Prescription
from .serializers import PrescriptionSerializer
# Create your views here.
from django.http import HttpResponse

def home(request):
    return HttpResponse("Hello Doctor 👨‍⚕️")
class PrescriptionViewSet(viewsets.ModelViewSet):
    queryset = Prescription.objects.all()
    serializer_class = PrescriptionSerializer
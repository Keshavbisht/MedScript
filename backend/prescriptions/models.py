from django.db import models
from datetime import date

class Prescription(models.Model):
    name = models.CharField(max_length=100)
    pnumber = models.CharField(max_length=15)
    birthDate = models.DateField(default=date(2000, 1, 1))   # ✅ default DOB
    age = models.IntegerField(default=0)
    weight = models.CharField(max_length=10)
    gender = models.CharField(max_length=10)
    symptoms = models.TextField(blank=True)
    tests = models.TextField(blank=True)
    addedSymptoms = models.JSONField(default=list, blank=True)
    temperature = models.CharField(max_length=10, blank=True)
    bp = models.CharField(max_length=20, blank=True)
    oxy = models.CharField(max_length=10, blank=True)
    medicine = models.TextField(blank=True)
    medications = models.JSONField(default=list, blank=True)
    instructions = models.TextField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Prescription for {self.name} ({self.age} yrs)"

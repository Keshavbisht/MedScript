from rest_framework import serializers
from prescriptions.models import Prescription  # import your model

class PrescriptionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Prescription
        fields = '__all__'  # or specify fields like ['id', 'name', 'birthDate']

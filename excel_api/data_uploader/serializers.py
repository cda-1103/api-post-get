from rest_framework import serializers
from .models import Products

class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Products

        fields = [
            'serial_number',
            'description',
            'category_id',
            'brand',
            'type',
            'quantity',
            'location_id'
        ]
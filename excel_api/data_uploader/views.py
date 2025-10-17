
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.db import IntegrityError 

from .serializers import ProductSerializer 

class CargarDatosExcel(APIView):
    
    def post(self, request):
        data_list = request.data
        serializer = ProductSerializer(data=data_list, many=True)
        
        if serializer.is_valid():
            try:
                
                serializer.save() 
            
            except IntegrityError as e:
                return Response(
                    {"error": "Integrity Error: Es probable que uno o más números de serie ya existan en la base de datos.", 
                     "details": str(e)},
                    status=status.HTTP_400_BAD_REQUEST
                    
                )
            
            return Response(
                {"message": f"¡{len(data_list)} registros de productos importados exitosamente!"},
                status=status.HTTP_201_CREATED
            )
        
        return Response(
            serializer.errors,
            status=status.HTTP_400_BAD_REQUEST
        )
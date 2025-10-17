from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.db import IntegrityError 
import logging
from .serializers import ProductSerializer 

logger = logging.getLogger('carga_archivo')

class CargarDatosExcel(APIView):
    
    def post(self, request): #maneja las solicitudes POST para cargar datos de productos desde un archivo Excel
        data_list = request.data
        serializer = ProductSerializer(data=data_list, many=True)
        
        if serializer.is_valid():
            try:
                
                serializer.save()  #guardar los datos validados en la base de datos
                logger.info(f"Se importaron {len(data_list)} registros de productos del Excel exitosamente.")

            except IntegrityError as e:
                logger.error(f"Error de integridad al importar datos: {str(e)}"),
                return Response(
                    {"error": "Integrity Error: Es probable que uno o más números de serie ya existan en la base de datos.", 
                     "details": str(e)},
                     
                    status=status.HTTP_400_BAD_REQUEST
                    
                )
            
            return Response(
               
                status=status.HTTP_201_CREATED
            )
        
        logger.info(f"Importación fallida"),
        return Response(
            serializer.errors,
            status=status.HTTP_400_BAD_REQUEST
        )
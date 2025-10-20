import 'dart:io';
import 'package:excel_p/excel_upload.dart';

void main(List<String> arguments) async {
  const apiUrl = 'http://127.0.0.1:8000/api/v1/productos/';  //URL de la API de Django REST Framework
  const excelFilePath = '/Users/claudiodavilaablan/Documents/productos.xlsx'; //ruta del archivo excel




  print('--- INICIANDO CARGA MASIVA ---');
  await uploadExcel(excelFilePath, apiUrl);
}

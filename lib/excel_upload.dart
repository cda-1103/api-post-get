import 'dart:io';
import 'dart:async';
//import 'package:excel/excel.dart';
import 'apiService.dart'; 

//metodo para procesar el archivo de excel
//recibe como parametros: filePath: la ruta del archivo y el url del API
Future<void> uploadExcel(String filePath, String apiUrl) async {

  var file = File(filePath);
  if (!file.existsSync()){ //verifica si el archivo existe
    print('Archivo no encontrado en: $filePath');
    return;
  }

  print('enviado el $filePath archivo de Excel');


  await sendFile(file, apiUrl);
  
  print('--- PROCESAMIENTO FINALIZADO ---');


}

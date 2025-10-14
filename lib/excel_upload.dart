import 'dart:io';
import 'dart:async';
import 'package:excel/excel.dart';
import 'product.dart';      //Importa la clase Product
import 'apiService.dart'; 

//metodo para procesar el archivo de excel
//recibe como parametros: filePath: la ruta del archivo y el url del API
Future<void> processExcel(String filePath, String apiUrl) async {

  var file = File(filePath);
  if (!file.existsSync()){
    print('Archivo no encontrado en: $filePath');
    return;
  }

  var bytes = file.readAsBytesSync();
  var excel = Excel.decodeBytes(bytes);

  var sheetName = excel.tables.keys.first;
  var sheet = excel.tables[sheetName]!;

  List<Future<void>> uploadTasks = [];

  print('Archivo cargado: $sheetName');

  for (var row in sheet.rows.skip(1)){ //se salta la fila 1 que es el encabezado
    //se lee columna por colunmna
    try {
      var serialNumberValue = row[1]?.value.toString() ??'';
      var descriptionValue = row[2]?.value.toString() ??'';
      //print('DIAGNÓSTICO: Valor leído de [1]: "${row[1]?.value}"');
      //print('DIAGNÓSTICO: Serial Number Value: "$serialNumberValue"');
      var categoryId = int.tryParse(row[3]?.value.toString() ?? '0') ?? 0;
      var brand = row[4]?.value.toString() ??'';
      var type = row[5]?.value.toString()??'';
      var quantity = double.tryParse(row[6]?.value.toString() ?? '0.0') ?? 0.0;
      var locationId = int.tryParse(row[7]?.value.toString() ?? '0') ?? 0;

      var product = Product(
        serialNumber: serialNumberValue, 
        description: descriptionValue, 
        categoryId: categoryId, 
        brand: brand, 
        type: type, 
        quantity: quantity, 
        locationId: locationId
        );

        if (serialNumberValue.isNotEmpty) {
          uploadTasks.add(uploadProduct(product, apiUrl));
        }

    } catch (e) {
      print('error al procesar una fila: $e');
    }
  }
  print('Esperando que ${uploadTasks.length} productos terminen de subir...');

  await Future.wait(uploadTasks);
  
  print('--- PROCESAMIENTO DE EXCEL FINALIZADO ---');


}

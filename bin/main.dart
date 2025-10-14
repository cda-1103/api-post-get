
import '../lib/excel_upload.dart'; 

void main(List<String> arguments) async {
  const apiUrl = 'https://prueba.requestcatcher.com/test'; 
  const excelFilePath = '/Users/claudiodavilaablan/Documents/productos.xlsx'; 

  print('--- INICIANDO CARGA MASIVA ---');
  await processExcel(excelFilePath, apiUrl);
}
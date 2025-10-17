
import 'package:excel_p/excel_upload.dart'; 

void main(List<String> arguments) async {
  const apiUrl = 'http://127.0.0.1:8000/api/v1/productos/'; 
  const excelFilePath = '/Users/claudiodavilaablan/Documents/productos.xlsx'; 

  print('--- INICIANDO CARGA MASIVA ---');
  await processExcel(excelFilePath, apiUrl);
}

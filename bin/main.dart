// bin/main.dart
import '../lib/excel_upload.dart'; // ✅ Usa '../lib/' para subir al directorio raíz y entrar a lib/

void main(List<String> arguments) async {
  // ⭐️ Define tus parámetros constantes
  const apiUrl = 'https://prueba.requestcatcher.com/test'; 
  const excelFilePath = '/Users/claudiodavilaablan/Documents/productos.xlsx'; 

  print('--- INICIANDO CARGA MASIVA ---');
  // Llama al controlador para iniciar el flujo completo
  await processExcel(excelFilePath, apiUrl);
}
//import 'dart:convert'; //importa para codificación y decodificación de JSON
import 'dart:io';
import 'package:http/http.dart' as http;
//import 'product.dart';

//metodo para la logica de conexion a la API metodo post 
Future<void> sendFile(File file, String apiUrl) async {

  final url = Uri.parse(apiUrl);
  var request = http.MultipartRequest('POST', url);
  
  request.files.add(
    await http.MultipartFile.fromPath('file', file.path),
  );


  try {
    var sendRequest = await request.send();

    var response = await http.Response.fromStream(sendRequest);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('Archivo enviado exitosamente!');
      print('Respuesta del servidor: ${response.body}');
    } else {
      print('Error al subir el archivo. Código de estado: ${response.statusCode}');
      print('Respuesta de la servidor: ${response.body}');
    }
  } catch (e) {
    print('Excepción al enviar el archivo: $e');
  }


}

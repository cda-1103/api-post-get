import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product.dart';

//metodo para la logica de conexion a la API metodo post 
Future<void> uploadProductList(List<Product>products, String apiUrl) async {
  final url = Uri.parse(apiUrl);
  
  final jsonList = products.map((p) => p.toJson()).toList();
  final jsonBody = jsonEncode(jsonList);

  print('Enviado la cantidad de: ${products.length} productos al servidor');

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonBody,
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('Exito en la carga masiva hacia el servidor. (status ${response.statusCode})');
    } else {
      print('Error ${response.statusCode} en la subida');
      print('repuesta:  ${response.body}');
    }


  } catch (e) {
    print('Fallo de conexion $e');
  }


}

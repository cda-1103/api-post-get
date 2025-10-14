import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product.dart';


Future<void> uploadProduct(Product product, String apiUrl) async {
  final url = Uri.parse(apiUrl);
  final jsonBody = jsonEncode(product.toJson());

  print('Enviaiado el producto ${product.serialNumber}');

  try {
    final response = await http.post(
      url,
      headers: {'Conten-Type': 'application/json'},
      body: jsonBody,
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('Exito: ${product.serialNumber} (status ${response.statusCode})');
    } else {
      print('Error ${response.statusCode} : ${product.serialNumber}');
      print('repuesta:  ${response.body}');
    }


  } catch (e) {
    print('Fallo de conexion para ${product.serialNumber}: $e');
  }


}

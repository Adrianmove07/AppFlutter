import 'package:senaflutterapp/views/entradaSena.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class LoginAuthServices {
  static Future<void> loginUser(
    String email,
    String contrasena,
    BuildContext context,
  ) async {
    final response =
        await http.post(Uri.parse('http://192.168.18.13:8000/api/login'),
        body: {
      'email': email,
      'password': contrasena,
    });

    if (response.statusCode == 200) {
      print('Inicio de sesión exitoso.');

      // Obtener el token de acceso desde la respuesta
      final responseData = json.decode(response.body);
      final token = responseData['access_token'];
      print('Token de acceso: $token');

      // Guardar el token de acceso en shared_preferences
       
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('access_token', token);

      // Redirigir a la pantalla deseada después del inicio de sesión exitoso
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EntradaSena()),
      );
    } else {
      throw Exception('Error en el inicio de sesión.');
    }
  }
}

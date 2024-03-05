import 'dart:convert';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:senaflutterapp/models/area_models.dart';
import 'package:senaflutterapp/utils/constants.dart';

class AreaService extends GetxController {
  Future<RenponseApiAreas> getAreas() async {
    final response = await http.get(Uri.parse(Constants.areaUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al cargar los datos de la API');
    }
  }
}

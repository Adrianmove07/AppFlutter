import 'package:http/http.dart' as http;
import 'package:senaflutterapp/utils/constants.dart';
import 'package:senaflutterapp/models/sede_models.dart';

class SedesService {
  Future<List<Sedes>?> getSedes() async {
    final response = await http.get(Uri.parse(Constants.sedesUrl));

    if (response.statusCode == 200) {
      var json = response.body;
      return sedesFromJson(json);
    } else {
      throw Exception('Error al cargar los datos de la API');
    }
  }
}

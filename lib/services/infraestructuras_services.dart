import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:senaflutterapp/models/infraestructuras_models.dart';
import 'package:senaflutterapp/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class infraestructurasServices extends GetxController {
  Future<List<InfraestructurasModels>?> getInfraestructura() async {
    var client = http.Client();
 SharedPreferences pref = await SharedPreferences.getInstance();
     String? acces_token = pref.getString('access_token');
       

    var uri = Uri.parse(Constants.infraestructurasUrl);
    var response = await client.get(uri, 
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $acces_token'
      });

    if (response.statusCode == 200) {
      var json = response.body;
      return infraestructurasModelsFromJson(json);
    }
  }
}

import 'dart:convert';

RenponseApiAreas areaFromjson(String x) {
  return RenponseApiAreas.fromJson(json.decode(x));
}

String areaToJson(RenponseApiAreas y) {
  return json.encode(y.toJson());
}

class RenponseApiAreas {
  List<Area> areas;
  RenponseApiAreas({

    required this.areas
  });
factory RenponseApiAreas.fromJson(Map<String, dynamic> json) {
    var areasList = json['areas'] as List;
    List<Area> areas = areasList
        .map((item) => Area.fromJson(item))
        .toList();

    return RenponseApiAreas(
     
      areas:areas,
    );
  }

  Map<String, dynamic> toJson() {
    return {

      "areas":
          List<dynamic>.from(areas.map((item) => item.toJson()))
    };
  }

}

class Area {
  int id;
  String iconUrl;
  String nombreArea;
  String codigo;
  List<Infraestructura> infraestructuras;

  Area({
    required this.id,
    required this.iconUrl,
    required this.nombreArea,
    required this.codigo,
    required this.infraestructuras,
  });

  factory Area.fromJson(Map<String, dynamic> json) {
    var infraestructurasList = json['infraestructuras'] as List;
    List<Infraestructura> infraestructuras = infraestructurasList
        .map((item) => Infraestructura.fromJson(item))
        .toList();

    return Area(
      id: json['id'],
      iconUrl: json['iconUrl'],
      nombreArea: json['nombreArea'],
      codigo: json['codigo'],
      infraestructuras: infraestructuras,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "iconUrl": iconUrl,
      "nombreArea": nombreArea,
      "codigo": codigo,
      "infraestructuras":
          List<dynamic>.from(infraestructuras.map((item) => item.toJson()))
    };
  }
}

class Infraestructura {
  int id;
  String nombreInfraestructura;
  int capacidad;
  String? codigoQr;
  String? descripcion;
  int idSede;
  int idArea;

  Infraestructura({
    required this.id,
    required this.nombreInfraestructura,
    required this.capacidad,
    this.codigoQr,
    this.descripcion,
    required this.idSede,
    required this.idArea,
  });

  factory Infraestructura.fromJson(Map<String, dynamic> json) {
    return Infraestructura(
      id: json['id'],
      nombreInfraestructura: json['nombreInfraestructura'],
      capacidad: json['capacidad'],
      codigoQr: json['codigoQr'],
      descripcion: json['descripcion'],
      idSede: json['idSede'],
      idArea: json['idArea'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nombreInfraestructura": nombreInfraestructura,
      "capacidad": capacidad,
      "codigoQr": codigoQr,
      "descripcion": descripcion,
      "idSede": idSede,
      "idArea": idArea
    };
  }
}

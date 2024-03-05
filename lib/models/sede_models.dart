
import 'dart:convert';

List<Sedes> sedesFromJson(String str) =>
    List<Sedes>.from(json.decode(str).map((x) => Sedes.fromJson(x)));

String sedesToJson(List<Sedes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sedes {
  final int id;
  final String nombreSede;
  final String direccion;
  final String telefono;
  final dynamic descripcion;
  final dynamic createdAt;
  final dynamic updatedAt;
  final int idCiudad;
  final int idCentroFormacion;
  final Ciudad ciudad;
  final CentroFormacion centroFormacion;
  final List<Infraestructura> infraestructuras;

  Sedes({
    required this.id,
    required this.nombreSede,
    required this.direccion,
    required this.telefono,
    required this.descripcion,
    required this.createdAt,
    required this.updatedAt,
    required this.idCiudad,
    required this.idCentroFormacion,
    required this.ciudad,
    required this.centroFormacion,
    required this.infraestructuras,
  });

  factory Sedes.fromJson(Map<String, dynamic> json) => Sedes(
        id: json["id"],
        nombreSede: json["nombreSede"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        descripcion: json["descripcion"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        idCiudad: json["idCiudad"],
        idCentroFormacion: json["idCentroFormacion"],
        ciudad: Ciudad.fromJson(json["ciudad"]),
        centroFormacion: CentroFormacion.fromJson(json["centro_formacion"]),
        infraestructuras: List<Infraestructura>.from(
            json["infraestructuras"].map((x) => Infraestructura.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombreSede": nombreSede,
        "direccion": direccion,
        "telefono": telefono,
        "descripcion": descripcion,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "idCiudad": idCiudad,
        "idCentroFormacion": idCentroFormacion,
        "ciudad": ciudad.toJson(),
        "centro_formacion": centroFormacion.toJson(),
        "infraestructuras":
            List<dynamic>.from(infraestructuras.map((x) => x.toJson())),
      };
}

class CentroFormacion {
  final int id;
  final String nombreCentro;
  final int idRegional;
  final dynamic createdAt;
  final dynamic updatedAt;

  CentroFormacion({
    required this.id,
    required this.nombreCentro,
    required this.idRegional,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CentroFormacion.fromJson(Map<String, dynamic> json) =>
      CentroFormacion(
        id: json["id"],
        nombreCentro: json["nombreCentro"],
        idRegional: json["idRegional"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombreCentro": nombreCentro,
        "idRegional": idRegional,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Ciudad {
  final int id;
  final String codigo;
  final String descripcion;
  final int idDepartamento;
  final dynamic createdAt;
  final dynamic updatedAt;

  Ciudad({
    required this.id,
    required this.codigo,
    required this.descripcion,
    required this.idDepartamento,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Ciudad.fromJson(Map<String, dynamic> json) => Ciudad(
        id: json["id"],
        codigo: json["codigo"],
        descripcion: json["descripcion"],
        idDepartamento: json["idDepartamento"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "codigo": codigo,
        "descripcion": descripcion,
        "idDepartamento": idDepartamento,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Infraestructura {
  final int id;
  final String nombreInfraestructura;
  final int capacidad;
  final String codigoQr;
  final dynamic descripcion;
  final dynamic createdAt;
  final dynamic updatedAt;
  final int idSede;
  final int idArea;

  Infraestructura({
    required this.id,
    required this.nombreInfraestructura,
    required this.capacidad,
    required this.codigoQr,
    required this.descripcion,
    required this.createdAt,
    required this.updatedAt,
    required this.idSede,
    required this.idArea,
  });

  factory Infraestructura.fromJson(Map<String, dynamic> json) =>
      Infraestructura(
        id: json["id"],
        nombreInfraestructura: json["nombreInfraestructura"],
        capacidad: json["capacidad"],
        codigoQr: json["codigoQr"] ?? "",
        descripcion: json["descripcion"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        idSede: json["idSede"],
        idArea: json["idArea"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombreInfraestructura": nombreInfraestructura,
        "capacidad": capacidad,
        "codigoQr": codigoQr,
        "descripcion": descripcion,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "idSede": idSede,
        "idArea": idArea,
      };
}

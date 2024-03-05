
import 'dart:convert';

List<InfraestructurasModels> infraestructurasModelsFromJson(String str) => List<InfraestructurasModels>.from(json.decode(str).map((x) => InfraestructurasModels.fromJson(x)));

String infraestructurasModelsToJson(List<InfraestructurasModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InfraestructurasModels {
    final int id;
    final String nombreInfraestructura;
    final int capacidad;
    final dynamic codigoQr;
    final dynamic descripcion;
    final dynamic createdAt;
    final dynamic updatedAt;
    final int idSede;
    final int idArea;
    final List<dynamic> grupos;
    final Sede sede;
    final Area area;

    InfraestructurasModels({
        required this.id,
        required this.nombreInfraestructura,
        required this.capacidad,
        required this.codigoQr,
        required this.descripcion,
        required this.createdAt,
        required this.updatedAt,
        required this.idSede,
        required this.idArea,
        required this.grupos,
        required this.sede,
        required this.area,
    });

    factory InfraestructurasModels.fromJson(Map<String, dynamic> json) => InfraestructurasModels(
        id: json["id"],
        nombreInfraestructura: json["nombreInfraestructura"],
        capacidad: json["capacidad"],
        codigoQr: json["codigoQr"],
        descripcion: json["descripcion"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        idSede: json["idSede"],
        idArea: json["idArea"],
        grupos: List<dynamic>.from(json["grupos"].map((x) => x)),
        sede: Sede.fromJson(json["sede"]),
        area: Area.fromJson(json["area"]),
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
        "grupos": List<dynamic>.from(grupos.map((x) => x)),
        "sede": sede.toJson(),
        "area": area.toJson(),
    };
}

class Area {
    final int id;
    final String iconUrl;
    final String nombreArea;
    final int codigo;
    final dynamic createdAt;
    final dynamic updatedAt;

    Area({
        required this.id,
        required this.iconUrl,
        required this.nombreArea,
        required this.codigo,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        iconUrl: json["iconUrl"],
        nombreArea: json["nombreArea"],
        codigo: json["codigo"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "iconUrl": iconUrl,
        "nombreArea": nombreArea,
        "codigo": codigo,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}

class Sede {
    final int id;
    final String nombreSede;
    final String direccion;
    final String telefono;
    final dynamic descripcion;
    final dynamic createdAt;
    final dynamic updatedAt;
    final int idCiudad;
    final int idCentroFormacion;

    Sede({
        required this.id,
        required this.nombreSede,
        required this.direccion,
        required this.telefono,
        required this.descripcion,
        required this.createdAt,
        required this.updatedAt,
        required this.idCiudad,
        required this.idCentroFormacion,
    });

    factory Sede.fromJson(Map<String, dynamic> json) => Sede(
        id: json["id"],
        nombreSede: json["nombreSede"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        descripcion: json["descripcion"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        idCiudad: json["idCiudad"],
        idCentroFormacion: json["idCentroFormacion"],
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
    };
}

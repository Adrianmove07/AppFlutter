class Regional {
  int id;
  String nombreRegional;
  String descripcion;

  Regional({
    required this.id,
    required this.nombreRegional,
    required this.descripcion,
  });

  factory Regional.fromJson(Map<String, dynamic> json) {
    return Regional(
      id: json['id'],
      nombreRegional: json['nombreRegional'],
      descripcion: json['descripcion'],
    );
  }
}

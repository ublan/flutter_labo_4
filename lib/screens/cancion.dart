import 'dart:convert';

Cancion cancionFromJson(String str) => Cancion.fromJson(json.decode(str));

String cancionToJson(Cancion data) => json.encode(data.toJson());

class Cancion {
  String msg;
  List<Datum> data;

  Cancion({
    required this.msg,
    required this.data,
  });

  factory Cancion.fromJson(Map<String, dynamic> json) => Cancion(
        msg: json["msg"] ?? '', // Asignar un valor predeterminado si es null
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String image;
  String nombre;
  String genero;
  int reproducciones;
  bool isfavorite;

  Datum({
    required this.image,
    required this.nombre,
    required this.genero,
    required this.reproducciones,
    required this.isfavorite,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        image: json["image"] ?? 'assets/canciones/cancion${json["id"]}.png', // Valor por defecto
        nombre: json["nombre"] ?? 'Sin nombre', // Valor por defecto
        genero: json["genero"] ?? 'Desconocido', // Valor por defecto
        reproducciones: _parseReproducciones(json["reproducciones"]),
        isfavorite: json["isfavorite"] ?? false, // Valor predeterminado para bool
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "nombre": nombre,
        "genero": genero,
        "reproducciones": reproducciones,
        "isfavorite": isfavorite,
      };

  /// Método auxiliar para manejar tipos mixtos de "reproducciones"
  static int _parseReproducciones(dynamic value) {
    if (value == null) return 0; // Manejar valor null
    if (value is int) return value;
    if (value is String) return int.tryParse(value) ?? 0;
    throw Exception("Formato inválido para 'reproducciones': $value");
  }
}


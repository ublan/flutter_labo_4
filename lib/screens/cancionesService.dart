import 'package:http/http.dart' as http;
import 'cancion.dart';

class CancionesService {
  final String apiUrl = 'http://192.168.0.175:3000/api/canciones';

  Future<Cancion> fetchCanciones() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return cancionFromJson(response.body); 
      } else {
        throw Exception('Error al cargar todas las canciones');
      }
    } catch (e) {
      print("Error al obtener los datos: $e");
      throw Exception('Error en la conexión con la API');
    }
  }
}
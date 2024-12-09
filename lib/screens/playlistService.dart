import 'package:http/http.dart' as http;
import 'playlist.dart';

class PlaylistService {
  final String apiUrl = 'http://192.168.0.193:3000/api/playlists';

  Future<Playlist> fetchPlaylists() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return playlistFromJson(response.body); // Decodifica y retorna el modelo
      } else {
        throw Exception('Error al cargar las playlists');
      }
    } catch (e) {
      print("Error al obtener los datos: $e");
      throw Exception('Error en la conexión con la API');
    }
  }
}

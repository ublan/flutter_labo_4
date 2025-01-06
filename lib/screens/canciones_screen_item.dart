import 'package:flutter/material.dart';
import 'cancion.dart';

class CancionesScreenItem extends StatefulWidget {
  const CancionesScreenItem({super.key});

  @override
  _CancionesScreenItemState createState() => _CancionesScreenItemState();
}

class _CancionesScreenItemState extends State<CancionesScreenItem> {
  late Datum cancion;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;

    if (args is Map<String, dynamic>) {
      // Acceder a los valores del Map y crear el objeto Datum
      cancion = Datum(
        image: args['image'] ?? 'assets/images/default.png',
        nombre: args['name'] ?? 'Canción Desconocida',
        genero: args['genre'] ?? 'Género Desconocido',
        reproducciones: args['listeners'] ?? 0,
        isfavorite: args['isFavorite'] ?? false,
      );
    } else {
      // Asignar valores predeterminados en caso de error o datos vacíos
      cancion = Datum(
        image: 'assets/images/default.png',
        nombre: 'Canción Desconocida',
        genero: 'Género Desconocido',
        reproducciones: 0,
        isfavorite: false,
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cancion.nombre),
        actions: [
          IconButton(
            icon: Icon(
              cancion.isfavorite ? Icons.favorite : Icons.favorite_border,
              color: cancion.isfavorite ? Colors.red : Colors.white,
            ),
            onPressed: () {
              setState(() {
                cancion.isfavorite = !cancion.isfavorite;
              });
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 250,
            color: Colors.grey[300],
            child: cancion.image.isNotEmpty
                ? Image.asset(
                    cancion.image,
                    fit: BoxFit.cover,
                  )
                : Center(
                    child: Text(
                      'Imagen no disponible',
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cancion.nombre,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${cancion.reproducciones} Reproducciones',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),
                Text(
                  'Género: ${cancion.genero}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  'Todos los derechos reservados ©',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.alternate_email, size: 30),
                    Icon(Icons.share, size: 30),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




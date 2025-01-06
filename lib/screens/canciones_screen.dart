import 'package:flutter/material.dart';
import 'cancionesService.dart'; // Archivo donde implementarás el servicio para la API
import 'cancion.dart'; // Modelo de Cancion y Datum

class CancionesScreen extends StatelessWidget {
  final CancionesService cancionService = CancionesService();

  CancionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;
    final iconColor = Theme.of(context).iconTheme.color;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Canciones',
          style: TextStyle(color: textColor),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: FutureBuilder<Cancion>(
        future: cancionService.fetchCanciones(), // Método para obtener canciones desde la API
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
            return const Center(child: Text('No hay canciones disponibles'));
          } else {
            final canciones = snapshot.data!.data;

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: canciones.length,
              itemBuilder: (BuildContext context, int index) {
                final cancion = canciones[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      'canciones_screen_item',
                      arguments: <String, dynamic>{
                        'image': cancion.image,
                        'name': cancion.nombre,
                        'genre': cancion.genero,
                        'listeners': cancion.reproducciones,
                        'isFavorite': cancion.isfavorite,
                      },
                    );
                  },
                  child: Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: cancion.image.startsWith('http')
                              ? Image.network(
                                  cancion.image,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Icon(
                                    Icons.music_video,
                                    size: 80,
                                    color: Colors.grey,
                                  ),
                                )
                              : Image.asset(
                                  cancion.image,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cancion.nombre,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                              ),
                              Text(
                                cancion.genero,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: textColor?.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  cancion.isfavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: cancion.isfavorite ? Colors.red : iconColor,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '${cancion.reproducciones}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: textColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Reproducciones',
                              style: TextStyle(
                                fontSize: 12,
                                color: textColor?.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}


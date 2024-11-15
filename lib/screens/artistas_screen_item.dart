import 'package:flutter/material.dart';

class ArtistasScreenItem extends StatelessWidget {
  const ArtistasScreenItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(args['name']),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 250,
            color: Colors.grey[300],
            child: Center(
              child: Text(
                'Imagen del Artista',
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
                  args['name'],
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  '${args['listeners']} oyentes mensuales',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),
                Text(
                  '${args['ranking']} en el mundo',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                const SizedBox(height: 16),
                Text(
                  '${args['genre']} 100%',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.account_circle, size: 40),
                    const SizedBox(width: 8),
                    Text(
                      'Publicado por ${args['name']}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.alternate_email, size: 30),
                    Icon(Icons.camera_alt, size: 30),
                    Icon(Icons.facebook, size: 30),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Tu biblioteca',
          ),
        ],
      ),
    );
  }
}

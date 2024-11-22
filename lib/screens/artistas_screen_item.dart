import 'package:flutter/material.dart';
class ArtistasScreenItem extends StatelessWidget {
  const ArtistasScreenItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final cardColor = Theme.of(context).cardColor;
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;
    final iconColor = Theme.of(context).iconTheme.color;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          args['name'],
          style: TextStyle(color: textColor),
        ),
      ),
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 250,
            color: cardColor,
            child: Center(
              child: Text(
                'Imagen del Artista',
                style: TextStyle(fontSize: 20, color: textColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: cardColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        args['name'],
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: textColor),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${args['listeners']} oyentes mensuales',
                        style: TextStyle(fontSize: 16, color: textColor),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        args['verificado'] ? 'Verificado' : '',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${args['genre']} 100%',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.account_circle, size: 40, color: iconColor),
                          const SizedBox(width: 8),
                          Text(
                            'Publicado por ${args['name']}',
                            style: TextStyle(fontSize: 14, color: textColor),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.alternate_email, size: 30, color: iconColor),
                          Icon(Icons.camera_alt, size: 30, color: iconColor),
                          Icon(Icons.facebook, size: 30, color: iconColor),
                        ],
                      ),
                    ],
                  ),
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

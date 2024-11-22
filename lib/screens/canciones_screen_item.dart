import 'package:flutter/material.dart';

class CancionesScreenItem extends StatefulWidget {
  const CancionesScreenItem({super.key});

  @override
  _CancionesScreenItemState createState() => _CancionesScreenItemState();
}

class _CancionesScreenItemState extends State<CancionesScreenItem> {
  late bool isFavorite;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    isFavorite = args['isFavorite'] ?? false; // Inicializar el estado desde los argumentos
  }

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
            child: args['image'] != null
                ? Image.asset(
                    args['image'],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      args['name'],
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite; // Cambia el estado
                        });
                      },
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(scale: animation, child: child);
                        },
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          key: ValueKey<bool>(isFavorite),
                          color: isFavorite ? Colors.red : Colors.grey,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '${args['listeners']} Reproducciones',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),
                Text(
                  'Género: ${args['genre']}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  'Todos los derechos reservados ©',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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

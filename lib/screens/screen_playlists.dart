import 'package:flutter/material.dart';
import 'package:flutter_guide_2024/mocks/playlist_mock.dart';  // Importa el archivo de mock aquí

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlists'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: playlist.length, // Usamos la lista importada
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                'custom_list_item',
                arguments: <String, dynamic>{
                  'avatar': playlist[index][0],
                  'name': playlist[index][1],
                  'cantidad': playlist[index][2],
                  'favorite': playlist[index][3],
                },
              );
            },
            child: Container(
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(31, 22, 78, 189),
                    blurRadius: 15,
                    spreadRadius: 5,
                    offset: Offset(0, 6),
                  )
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/avatars/${playlist[index][0]}.png',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          playlist[index][1],
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('${playlist[index][2]} canciones'),
                      ],
                    ),
                  ),
                  Icon(
                    playlist[index][3] ? Icons.star : Icons.star_border_outlined,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
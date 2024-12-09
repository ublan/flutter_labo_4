import 'package:flutter/material.dart';
import 'package:spotyland/mocks/playlist_mock.dart'; 

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlists'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: playlist.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                'playlist_item_card',
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
                gradient: LinearGradient(
                  colors: [const Color.fromARGB(255, 213, 230, 245), const Color.fromARGB(255, 221, 235, 247)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/avatars/${playlist[index][0]}.png',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        playlist[index][1],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        '${playlist[index][2]} canciones',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    playlist[index][3] ? Icons.favorite : Icons.favorite_border,
                    color: playlist[index][3] ? Colors.red : const Color.fromARGB(255, 116, 94, 94),
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

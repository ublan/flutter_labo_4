import 'package:flutter/material.dart';
import 'playlistService.dart';
import 'playlist.dart';

class PlaylistScreen extends StatelessWidget {
  final PlaylistService playlistService = PlaylistService();

  PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlists'),
      ),
      body: FutureBuilder<Playlist>(
        future: playlistService.fetchPlaylists(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
            return const Center(child: Text('No playlists available'));
          } else {
            final playlists = snapshot.data!.data; 

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: playlists.length,
              itemBuilder: (context, index) {
                final playlist = playlists[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      'playlist_item_card',
                      arguments: playlist,
                    );
                  },
                  child: Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(255, 213, 230, 245),
                          const Color.fromARGB(255, 221, 235, 247),
                        ],
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
                          child: playlist.avatar.startsWith('http')
                              ? Image.network(
                                  playlist.avatar,
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
                                  'assets/avatars/${playlist.avatar}.png',
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
                              playlist.nameplaylist,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              '${playlist.cantidad} canciones',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Icon(
                          playlist.favorites ? Icons.favorite : Icons.favorite_border,
                          color: playlist.favorites ? Colors.red : const Color.fromARGB(255, 116, 94, 94),
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

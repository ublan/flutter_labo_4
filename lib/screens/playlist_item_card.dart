import 'package:flutter/material.dart';
import 'playlist.dart';

class PlaylistScreenItem extends StatelessWidget {
  const PlaylistScreenItem({super.key});

  @override
  Widget build(BuildContext context) {
    
    final playlist = ModalRoute.of(context)!.settings.arguments as Datum?;

   
    final playlistData = playlist ?? Datum(
      avatar: 'avatar1',
      nameplaylist: 'Mi Playlist',
      cantidad: 10,
      favorites: true,
      idplaylist: 'id1',
    );

    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final cardColor = Theme.of(context).cardColor;
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;
    final iconColor = Theme.of(context).iconTheme.color;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          playlistData.nameplaylist,
          style: TextStyle(color: textColor),
        ),
        actions: [
          IconButton(
            icon: Icon(
              playlistData.favorites ? Icons.favorite : Icons.favorite_border,
              color: playlistData.favorites ? Colors.red : iconColor,
            ),
            onPressed: () {
             
            },
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: playlistData.avatar.startsWith('http')
                          ? NetworkImage(playlistData.avatar)
                          : AssetImage('assets/avatars/${playlistData.avatar}.png') as ImageProvider,
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Text(
                    playlistData.nameplaylist,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${playlistData.cantidad} canciones',
                      style: TextStyle(fontSize: 16, color: textColor),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: List.generate(
                        5,
                        (index) => const Icon(Icons.star, color: Colors.amber, size: 20),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(Icons.play_arrow, size: 50, color: iconColor),
                          onPressed: () {
                           
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.shuffle, size: 50, color: iconColor),
                          onPressed: () {
                            
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

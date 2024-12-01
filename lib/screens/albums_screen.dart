import 'package:flutter/material.dart';
import 'package:spotyland/mocks/albums_mock.dart' show albums;

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;
    final iconColor = Theme.of(context).iconTheme.color;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Albums',
          style: TextStyle(color: textColor),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: albums.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'albums_screen_item',
                  arguments: <String, dynamic>{
                    'title': albums[index][1],
                    'artist': albums[index][2],
                    'cover': albums[index][3],
                    'releaseDate': albums[index][4],
                    'tracks': albums[index][5],
                  });
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
                children: [
                  Image.asset(
                    '/albums/${albums[index][3]}',
                    width: 50,
                    height: 50,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.error,
                        size: 50,
                        color: Colors.red,
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          albums[index][1],
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        Text(
                          albums[index][2],
                          style: TextStyle(
                            fontSize: 14,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    albums[index][4].toString(),
                    style: TextStyle(color: textColor),
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

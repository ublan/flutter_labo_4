import 'package:flutter/material.dart';
import 'package:spotyland/mocks/artistas_mock.dart' show elements;

class ArtistasScreen extends StatelessWidget {
  const ArtistasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;
    final iconColor = Theme.of(context).iconTheme.color;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Artistas',
          style: TextStyle(color: textColor),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: elements.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'artistas_screen_item',
                  arguments: <String, dynamic>{
                    'image': elements[index][5],
                    'name': elements[index][1],
                    'genre': elements[index][2],
                    'listeners': elements[index][3],
                    'verificado': elements[index][4],
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
                    'assets/artistas/${elements[index][0]}.png',
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
                          elements[index][1],
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        Text(
                          elements[index][2],
                          style: TextStyle(
                            fontSize: 14,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    elements[index][4] ? Icons.star : Icons.star_border_outlined,
                    color: iconColor,
                  ),
                  Text(
                    elements[index][3].toString(),
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

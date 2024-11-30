import 'package:flutter/material.dart';
import 'package:spotyland/mocks/canciones_mock.dart' show elements;

class CancionesScreen extends StatelessWidget {
  const CancionesScreen({super.key});

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
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: elements.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                'canciones_screen_item',
                arguments: <String, dynamic>{
                  'image': 'assets/canciones/${elements[index][0]}.png',
                  'name': elements[index][1],
                  'genre': elements[index][2],
                  'listeners': elements[index][3],
                  'isFavorite': elements[index][4],
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
                            elements[index][4]
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: elements[index][4] ? Colors.red : iconColor,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${elements[index][3]}',
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
      ),
    );
  }
}

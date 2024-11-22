
import 'package:flutter/material.dart';
import 'package:flutter_guide_2024/mocks/canciones_mock.dart' show elements;

class CancionesScreen extends StatelessWidget {
  const CancionesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Canciones'),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          elements[index][1],
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          elements[index][2],
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
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
                            color: elements[index][4] ? Colors.red : Colors.grey,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${elements[index][3]}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Reproducciones',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
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


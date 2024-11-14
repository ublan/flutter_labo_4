import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_guide_2024/mocks/artistas_mock.dart' show elements;

class ArtistasScreen extends StatelessWidget {
  const ArtistasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artistas'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: elements.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'custom_list_item',
                  arguments: <String, dynamic>{
                    'avatar': elements[index][0],
                    'name': elements[index][1],
                    'cargo': elements[index][2],
                    'stars': elements[index][3],
                    'favorite': elements[index][4],
                  });
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
                      offset: Offset(0, 6))
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/avatars/${elements[index][0]}.png',
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
                          elements[index][1],
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Text(elements[index][2]),
                      ],
                    ),
                  ),
                  Icon(
                    elements[index][4]
                        ? Icons.star
                        : Icons.star_border_outlined,
                  ),
                  Text(elements[index][3].toString())
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

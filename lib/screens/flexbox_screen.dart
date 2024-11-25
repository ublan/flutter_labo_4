import 'package:flutter/material.dart';
import '../widgets/create_container.dart';

class FlexboxScreen extends StatelessWidget {
  const FlexboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexbox'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () =>
                Navigator.pushReplacementNamed(context, 'material_library'),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: Icon(Icons.home),
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        width: 300,
        decoration: BoxDecoration(
            border:
                Border.all(width: 2, color: const Color.fromARGB(65, 0, 0, 0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < 3; i++)
              CreateContainer(
                width: 50,
                height: 50,
                cajaColor: Colors.greenAccent,
              ),
          ],
        ),
      ),
    );
  }
}

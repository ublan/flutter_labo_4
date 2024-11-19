import 'dart:developer';

import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  String url;
  String title;
  String? body;

  CardScreen({super.key, required this.url, required this.title, this.body});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.blueGrey,
      elevation: 10,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(children: [
        Image.network(this.url),
        const SizedBox(
          height: 15,
        ),
        Text(
          this.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        if (this.body != null)
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              this.body ?? '',
              textAlign: TextAlign.justify,
            ),
          ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  log('click cancelar');
                },
                child: Text('Cancelar')),
            const SizedBox(
              width: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  log('click aceptar');
                },
                child: Text('Aceptar')),
            const SizedBox(
              width: 15,
            ),
          ],
        )
      ]),
    );
  }
}
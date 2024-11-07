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
          height: 8,
        ),
        Text(
          this.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        if (this.body != null)
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              this.body ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
            ),
          ),
      ]),
    );
  }
}

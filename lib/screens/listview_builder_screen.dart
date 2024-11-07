import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_guide_2024/searchs/search_demo.dart';

class ListViewBuilderScreen extends StatelessWidget {
  const ListViewBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Builder + Search'),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () =>
                  showSearch(context: context, delegate: SearchDemo()))
        ],
      ),
      body: Center(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            log('posicion $index');
            return ListTile(
                leading: const Icon(Icons.check_box),
                title: Text('Elemento nro $index'),
                subtitle: const Text('Subtitulo de la lista'),
                trailing: const Icon(Icons.people));
          },
        ),
      ),
    );
  }
}

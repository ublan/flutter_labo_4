import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_guide_2024/widgets/drawer_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        leadingWidth: 40,
        toolbarHeight: 80,
      ),
      drawer: DrawerMenu(),
      body: const Center(child: Text('Hola mundo')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one),
        onPressed: () {
          log('click button');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

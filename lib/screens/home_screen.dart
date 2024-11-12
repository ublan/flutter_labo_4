import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_guide_2024/widgets/drawer_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(), // Agrega el Drawer aqui
      appBar: AppBar(
        title: const Text(
        'SpotyLand',
        style: TextStyle(
        color: Color.fromARGB(255, 122, 122, 122),
        fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 122, 122, 122),
      ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF7FA5C4), // Color del cielo
              Color(0xFFE3E3E1), // Color del suelo
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/images/album_cover.jpg',
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Nueva Era',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Duki, Myke Towers',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 20),
            Slider(
              value: 30,
              max: 100,
              min: 0,
              activeColor: Colors.white,
              inactiveColor: Colors.white24,
              onChanged: (value) {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "1:14",
                    style: TextStyle(color: Colors.white70),
                  ),
                  Text(
                    "-0:08",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.shuffle, color: Colors.white70),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.skip_previous, color: Colors.white),
                  iconSize: 36,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.play_circle_fill, color: Colors.white),
                  iconSize: 64,
                  onPressed: () {
                    log('Play button pressed');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.skip_next, color: Colors.white),
                  iconSize: 36,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.repeat, color: Colors.white70),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

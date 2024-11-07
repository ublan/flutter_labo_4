import 'package:flutter/material.dart';
import 'package:flutter_guide_2024/widgets/create_container.dart';
import 'package:flutter_guide_2024/widgets/drawer_menu.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: 400,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: const Color.fromARGB(230, 200, 103, 7),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                CreateContainer(
                  width: double.infinity,
                  height: 200,
                  cajaColor: Colors.green,
                ),
                const CircleAvatar(
                  radius: 90,
                  child: Icon(
                    Icons.people,
                    size: 80,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 100,
                    height: 50,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (int i = 1; i <= 3; i++)
                          const Icon(
                            Icons.star,
                            color: Colors.blueAccent,
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

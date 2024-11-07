import 'dart:developer';

import 'package:flutter/material.dart';
import '../widgets/create_box.dart';
import '../widgets/create_container.dart';
import '../widgets/create_card.dart';

class MaterialScreen extends StatelessWidget {
  const MaterialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Libreria Material'),
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Texto con estilo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 3,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                      'Texto expandido',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Icon(Icons.add),
                  Icon(Icons.people),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 3,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Container + Row',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CreateBox(
                  width: 50,
                  height: 50,
                  color: Colors.amber,
                  margin: 10,
                  padding: 10,
                  icon: Icons.place,
                ),
                CreateBox(
                  width: 50,
                  height: 50,
                  margin: 10,
                  padding: 10,
                  texto: 'data',
                ),
                CreateBox(
                  width: 50,
                  height: 50,
                  color: Colors.amber,
                  margin: 10,
                  padding: 10,
                  icon: Icons.place,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 3,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Listview Scroll horizontal',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Avatar(icono: Icons.verified_user, padding: 5),
                    Avatar(icono: Icons.check, padding: 5),
                    Avatar(icono: Icons.add, padding: 5),
                    Avatar(icono: Icons.room_rounded, padding: 5),
                    Avatar(icono: Icons.map, padding: 5),
                    Avatar(icono: Icons.insert_chart, padding: 5),
                    Avatar(icono: Icons.menu, padding: 5),
                    Avatar(icono: Icons.exit_to_app, padding: 5),
                  ]),
            ),
            const SizedBox(
              height: 25,
            ),
            const Divider(
              height: 3,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CreateContainer(
                  width: 100,
                  height: 100,
                  cajaColor: Colors.amberAccent,
                  child: const Text('Caja texto'),
                ),
                CreateContainer(
                  width: 50,
                  height: 50,
                  cajaColor: Colors.greenAccent,
                ),
                CreateContainer(
                  width: 75,
                  height: 100,
                  cajaColor: Colors.blueAccent,
                  child: const Text(
                    'Caja texto',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const Divider(
              height: 3,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 220,
              margin: EdgeInsets.zero,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    for (int i = 0; i <= 6; i++)
                      CreateContainer(
                        width: 150,
                        height: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: CardScreen(
                          title: 'título de la card',
                          body:
                              'Pariatur sint nisi sint esse pariatur irure laborum est incididunt eiusmod sunt. Magna dolor consectetur laborum eu do ex velit. Incididunt ut adipisicing culpa est excepteur consequat minim veniam veniam velit eiusmod ullamco mollit duis. Consequat Lorem pariatur fugiat elit occaecat voluptate sit ad. Qui nulla eu esse elit quis adipisicing officia aute eiusmod nulla laboris dolor consequat.',
                          url:
                              'https://images.unsplash.com/photo-1444927714506-8492d94b4e3d?q=80&w=1476&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        ),
                      ),
                  ]),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.align_horizontal_right_sharp),
        onPressed: () {
          log('click button');
          Navigator.pushReplacementNamed(context, 'flexbox');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class Avatar extends StatelessWidget {
  IconData icono;
  double? radio;
  double? padding;

  Avatar({super.key, required this.icono, this.radio, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(this.padding ?? 0.0),
      child: CircleAvatar(
        child: Icon(this.icono),
        radius: this.radio ?? 40,
      ),
    );
  }
}

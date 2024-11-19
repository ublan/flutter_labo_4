import 'package:flutter/material.dart';
import 'package:flutter_guide_2024/screens/card_screen.dart';

class ListCardScreen extends StatelessWidget {
  const ListCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 15,
            );
          },
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                CardScreen(
                  url:
                      'https://images.unsplash.com/photo-1444927714506-8492d94b4e3d?q=80&w=1476&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  title: 'titulo de prueba ',
                  body:
                      'Incididunt reprehenderit non ullamco deserunt laborum adipisicing elit. Irure est consectetur eu non dolor nisi deserunt id ipsum commodo ex in. Sunt sit non dolor aliquip ullamco do velit proident magna esse commodo eiusmod duis labore. Elit eu enim laboris elit aute labore et deserunt sint irure aliquip. Commodo ut velit elit incididunt.',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
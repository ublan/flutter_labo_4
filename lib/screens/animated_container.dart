import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});
  @override
  State<AnimatedContainerScreen> createState() => _ContainerStatePage();
}

class _ContainerStatePage extends State<AnimatedContainerScreen> {
  double _width = 250;
  double _height = 250;
  double _rotation = 6.1;

  BorderRadius _borderRaduis = BorderRadius.circular(20);

  Color _color = Colors.red;

  void refreshContainer() {
    final random = Random();

    setState(() {
      _width = random.nextInt(250).toDouble() + 50;
      _height = random.nextInt(250).toDouble() + 50;
      _rotation = random.nextInt(50).toDouble();
      _borderRaduis = BorderRadius.circular(random.nextInt(20).toDouble());
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(250), random.nextInt(250), 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container Page'),
      ),
      drawer: DrawerMenu(),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          duration: const Duration(milliseconds: 1800),
          curve: Curves.bounceIn,
          transformAlignment: const Alignment(0, 0),
          transform: Matrix4.rotationZ(_rotation),
          decoration: BoxDecoration(color: _color, borderRadius: _borderRaduis),
          child: const Center(
              child: Text(
            'PRUEBA',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: refreshContainer,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

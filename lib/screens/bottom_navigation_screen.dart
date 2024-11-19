import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Provider Demo'),
        elevation: 10,
        toolbarHeight: 80,
      ),
      bottomNavigationBar: ElementsButtonWidget(),
      body: const ElementsBody(),
    );
  }
}

class ElementsButtonWidget extends StatefulWidget {
  const ElementsButtonWidget({
    super.key,
  });

  @override
  State<ElementsButtonWidget> createState() => _ElementsButtonWidgetState();
}

class _ElementsButtonWidgetState extends State<ElementsButtonWidget> {
  int _paginaActual = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _paginaActual,
        elevation: 10,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          print('value: $value');
          setState(() {
            _paginaActual = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'QR',
            activeIcon: Icon(Icons.qr_code_2_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Q2',
            activeIcon: Icon(Icons.qr_code_2_outlined),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: 'Q3',
              activeIcon: Icon(Icons.qr_code_2_outlined),
              tooltip: 'Boton 3'),
        ]);
  }
}

class ElementsBody extends StatelessWidget {
  const ElementsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Text Body'),
    );
  }
}

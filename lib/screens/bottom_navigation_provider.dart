import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationProvider extends StatelessWidget {
  const BottomNavigationProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _handlerPage(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Provider Demo'),
          elevation: 10,
          toolbarHeight: 80,
        ),
        bottomNavigationBar: ElementsButtonProvider(),
        body: const ElementsBodyProvider(),
      ),
    );
  }
}

class ElementsButtonProvider extends StatelessWidget {
  const ElementsButtonProvider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final page = Provider.of<_handlerPage>(context, listen: true);

    return BottomNavigationBar(
        currentIndex: page.paginaActual,
        elevation: 10,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          print('value: $value');
          page.paginaActual = value;
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

class ElementsBodyProvider extends StatelessWidget {
  const ElementsBodyProvider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final page = Provider.of<_handlerPage>(context, listen: true);

    Widget widget;
    switch (page.paginaActual) {
      case 0:
        widget = const Text('Primera Solapa');
        break;
      case 1:
        widget = const Text('Segunda Solapa');
        break;
      case 2:
        widget = const Text('Tercer Solapa');
        break;
      default:
        widget = const Text('Ninguna Solapa');
    }
    return Center(child: widget);
  }
}

class _handlerPage extends ChangeNotifier {
  int _paginaActual = 0;

  int get paginaActual => _paginaActual;

  set paginaActual(int value) {
    _paginaActual = value;
    notifyListeners();
  }
}

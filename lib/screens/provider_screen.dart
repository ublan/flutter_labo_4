import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemoProviderScreen extends StatelessWidget {
  const DemoProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _handlerPage(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Provider Demo'),
          elevation: 10,
          toolbarHeight: 80,
        ),
        bottomNavigationBar: ControlNavigation(),
        body: const ElementsBody(),
      ),
    );
  }
}

class ControlNavigation extends StatelessWidget {
  ControlNavigation({super.key});

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

class ElementsBody extends StatelessWidget {
  const ElementsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final page = Provider.of<_handlerPage>(context, listen: true);
    final Widget widget;
    print('ElementsBody  ${page.paginaActual}');
    switch (page.paginaActual) {
      case 0:
        widget = Text('Text Body 0');
        break;
      case 1:
        widget = Text('Text Body 1');
      default:
        widget = Text('Text Body 2');
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

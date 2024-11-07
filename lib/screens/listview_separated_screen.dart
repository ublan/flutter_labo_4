import 'package:flutter/material.dart';

class ListViewSeparatedScreen extends StatelessWidget {
  const ListViewSeparatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.separated(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Texto prueba data ${index + 1}'),
              leading: const Icon(Icons.check_box),
              trailing: const Icon(Icons.people),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
                height: 10, color: Color.fromARGB(65, 0, 0, 0));
          },
        ),
      ),
    );
  }
}

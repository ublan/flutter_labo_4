import 'package:flutter/material.dart';

class DesignScreen extends StatelessWidget {
  const DesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Desgin demo')),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1444927714506-8492d94b4e3d?q=80&w=1476&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')),
          const Encabezado(),
          const Botonera(),
          Container(
            padding: const EdgeInsets.all(10),
            height: 80,
            child: const Text(
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
              ),
              'Eiusmod consequat mollit reprehenderit in elit eiusmod. Laborum aliquip dolore amet elit sunt laborum veniam esse amet ad. Irure laboris nostrud dolore fugiat. Id esse quis ea Lorem culpa consectetur occaecat voluptate officia deserunt et exercitation aute quis.',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}

class Botonera extends StatelessWidget {
  const Botonera({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(border: Border.all(width: 1)),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Icon(Icons.phone),
                SizedBox(
                  height: 10,
                ),
                Text('Phone')
              ],
            ),
            Column(
              children: [Icon(Icons.share), Text('Share')],
            ),
            Column(
              children: [Icon(Icons.telegram), Text('Telegram')],
            ),
          ],
        ));
  }
}

class Encabezado extends StatelessWidget {
  const Encabezado({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(border: Border.all(width: 1)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: const EdgeInsets.all(10),
      child: const Row(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('prueba'),
              Text('prueba'),
            ],
          )),
          Icon(
            Icons.star,
            color: Colors.red,
          ),
          SizedBox(
            width: 10,
          ),
          Text('41'),
        ],
      ),
    );
  }
}

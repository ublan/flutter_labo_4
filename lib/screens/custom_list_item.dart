import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  List? item;

  CustomListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Obtiene los argumentos pasados
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // Accede a cada argumento con su clave
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('CustomListItem'),
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderProfileCustomItem(
              size: size,
              avatar: args['avatar'],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: BodyProfileCustomItem(args: args),
            ),
          ],
        ),
      ),
    );
  }
}

class BodyProfileCustomItem extends StatelessWidget {
  bool darkMode = false;
  Map<String, dynamic> args;

  BodyProfileCustomItem({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    print('args favorite : ${args['favorite']}');
    return Column(
      children: [
        SwitchListTile.adaptive(
          title: const Text('Favorito'),
          value: args['favorite'],
          onChanged: (value) {
            print(value);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
            onChanged: (value) {},
            style: const TextStyle(fontSize: 18),
            initialValue: args['cargo'] ?? '',
            decoration: decorationInput(
                label: 'Cargo', helperText: 'Ingresar número sin 0 ni 15')),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
            onChanged: (value) {},
            style: const TextStyle(fontSize: 18),
            initialValue: args['name'] ?? '',
            keyboardType: TextInputType.text,
            decoration: decorationInput(label: 'Nombre y Apellido')),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
            onChanged: (value) {},
            style: const TextStyle(fontSize: 18),
            initialValue: args['stars'].toString(),
            keyboardType: TextInputType.text,
            decoration: decorationInput(label: 'Stars')),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  InputDecoration decorationInput(
      {IconData? icon, String? hintText, String? helperText, String? label}) {
    return InputDecoration(
      fillColor: Colors.black,
      label: Text(label ?? ''),
      hintText: hintText,
      helperText: helperText,
      helperStyle: const TextStyle(fontSize: 16),
      prefixIcon: (icon != null) ? Icon(icon) : null,
    );
  }
}

class HeaderProfileCustomItem extends StatelessWidget {
  final Size size;
  String? avatar;

  HeaderProfileCustomItem({
    super.key,
    this.avatar,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.40,
      color: const Color(0xff2d3e4f),
      child: Center(
        child: CircleAvatar(
          radius: 100,
          child: avatar != ""
              ? Image.asset('assets/avatars/$avatar.png')
              : Image.asset('assets/images/avatar.png'),
        ),
      ),
    );
  }
}

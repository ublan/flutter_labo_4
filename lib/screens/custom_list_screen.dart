import 'dart:developer';
import 'package:flutter_guide_2024/mocks/people_mock.dart' show elements;
import 'package:flutter/material.dart';
import 'package:flutter_guide_2024/searchs/search_demo.dart';

class CustomListScreen extends StatefulWidget {
  CustomListScreen({super.key});

  @override
  State<CustomListScreen> createState() => _CustomListScreenState();
}

class _CustomListScreenState extends State<CustomListScreen> {
  List _auxiliar_elements = [];
  String _searchQuery = '';
  bool _searchActive = false;

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _auxiliar_elements = elements;
  }

  @override
  void dispose() {
    // Limpiar el controlador al destruir el widget
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _updateSearch(String? query) {
    setState(() {
      _searchQuery = query ?? '';
      if (_searchQuery.isEmpty) {
        _auxiliar_elements = elements; // Restablecer al estado original
      } else {
        _auxiliar_elements = elements.where((element) {
          return element[1].toLowerCase().contains(_searchQuery.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          body: Column(children: [
        SearchArea(),
        ListItemsArea(),
      ])),
    );
  }

  Expanded ListItemsArea() {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _auxiliar_elements.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'custom_list_item',
                  arguments: <String, dynamic>{
                    'avatar': elements[index][0],
                    'name': elements[index][1],
                    'cargo': elements[index][2],
                    'stars': elements[index][3],
                    'favorite': elements[index][4],
                  });
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onLongPress: () {
              log('onLongPress $index');
            },
            child: Container(
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(31, 22, 78, 189),
                        blurRadius: 15,
                        spreadRadius: 5,
                        offset: Offset(0, 6))
                  ]),
              child: Row(
                children: [
                  Image.asset(
                      'assets/avatars/${_auxiliar_elements[index][0]}.png',
                      width: 50,
                      height: 50),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _auxiliar_elements[index][1],
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Text(_auxiliar_elements[index][2]),
                      ],
                    ),
                  ),
                  Icon(_auxiliar_elements[index][4]
                      ? Icons.star
                      : Icons.star_border_outlined),
                  Text(_auxiliar_elements[index][3].toString())
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  AnimatedSwitcher SearchArea() {
    return AnimatedSwitcher(
      switchInCurve: Curves.bounceIn,
      switchOutCurve: Curves.bounceOut,
      duration: Duration(milliseconds: 300),
      child: (_searchActive)
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _searchController,
                      focusNode: _focusNode,
                      onChanged: (value) {
                        _updateSearch(value);
                      },
                      onFieldSubmitted: (value) {
                        _updateSearch(value);
                      },
                      decoration: InputDecoration(hintText: 'Buscar...'),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _searchController.clear();
                      FocusManager.instance.primaryFocus?.unfocus();
                      _updateSearch('');
                    },
                    icon: Icon(Icons.clear),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _searchActive = false;
                      });
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ],
              ),
            )
          : Container(
              padding: EdgeInsets.all(2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.keyboard_arrow_left_outlined)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _searchActive = !_searchActive;
                        });
                        _focusNode.requestFocus();
                      },
                      icon: Icon(Icons.search)),
                ],
              ),
            ),
    );
  }
}

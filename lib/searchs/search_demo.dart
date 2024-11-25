import 'package:flutter/material.dart';

class SearchDemo extends SearchDelegate {
  @override
  
  String? get searchFieldLabel => 'Buscar...';

  @override
  List<Widget>? buildActions(BuildContext context) {
    
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () => close(context, 'null'),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    
    return const Center(child: Text('build results'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print(query);
    
    return const Column(
      children: [],
    );
  }
}

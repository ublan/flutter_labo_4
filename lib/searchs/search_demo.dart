import 'package:flutter/material.dart';

class SearchDemo extends SearchDelegate {
  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Buscar...';

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () => close(context, 'null'),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return const Center(child: Text('build results'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print(query);
    // TODO: implement buildSuggestions
    return const Column(
      children: [],
    );
  }
}

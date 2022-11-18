import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<int> _numbersList = [1, 2, 3, 4, 5, 6, 7];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lists")),
      body: _createList(),
    );
  }

  Widget _createList() {
    return ListView.builder(
      itemCount: _numbersList.length,
      itemBuilder: (BuildContext context, int index) {
        final imageIndex = _numbersList[index];
        return FadeInImage(
            placeholder: AssetImage('assets/image_loading.gif'),
            image: NetworkImage("https://picsum.photos/500/300?random=$imageIndex"));
      },
    );
  }
}

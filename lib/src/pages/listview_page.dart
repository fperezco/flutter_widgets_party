import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<int> _numbersList = [];
  int _lastNumber = 0;
  ScrollController _scrollController = ScrollController();
  // It is called in the onInit
  @override
  void initState() {
    super.initState();
    _add10MoreImages();
    _scrollController.addListener(() {
      //print("scroll executed");
      //if we are in the end of the page....
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _add10MoreImages();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lists")),
      body: _createList(),
    );
  }

  Widget _createList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _numbersList.length,
      itemBuilder: (BuildContext context, int index) {
        final imageIndex = _numbersList[index];
        return Column(
          children: [
            FadeInImage(
                placeholder: AssetImage('assets/image_loading.gif'),
                image: NetworkImage(
                    "https://picsum.photos/500/300?random=$imageIndex")),
            Text("- Image number: $imageIndex -"),
            SizedBox(height: 10.0)        
          ],
        );
      },
    );
  }

  void _add10MoreImages() {
    for (var i = 1; i < 10; i++) {
      _lastNumber++;
      _numbersList.add(_lastNumber);
    }

    setState(() {});
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<int> _numbersList = [];
  int _lastNumber = 0;
  bool _isLoading = false;
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
        //_add10MoreImages();
        _fetchData();
      }
    });
  }

  //Executed when leaves the page
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //destroy to prevent memory issues
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Lists")),
        body: Stack(
          //diferent layers of widgets
          children: <Widget>[_createList(), _createLoading()],
        ));
  }

  Widget _createList() {
    // to manage what happens when user makes pull ( tirar del extremo superior)
    return RefreshIndicator(
      onRefresh: _refreshWholeImageGallery, //not ()!!!
      child: ListView.builder(
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
      ),
    );
  }

  void _add10MoreImages() {
    for (var i = 1; i < 10; i++) {
      _lastNumber++;
      _numbersList.add(_lastNumber);
    }

    setState(() {});
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {});
    final customDuration = Duration(seconds: 2);
    return new Timer(customDuration, customHttpResponse);
  }

  //simulate an http call
  void customHttpResponse() {
    _isLoading = false;
    _add10MoreImages();
    //move programmatically the scroll a little bit down to open the new 10 images block
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(microseconds: 250), curve: Curves.fastOutSlowIn);
  }

  _createLoading() {
    if (_isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [CircularProgressIndicator(), SizedBox(height: 15.0)],
        ),
      );
    } else {
      return Container();
    }
  }

  //simulate consume endpoint with 2 seconds ...
  Future _refreshWholeImageGallery() async {
    final customDuration = Duration(seconds: 2);
    new Timer(customDuration, () {
      _numbersList.clear();
      _lastNumber++;
      _add10MoreImages();
    });

    return Future.delayed(customDuration);
  }
}

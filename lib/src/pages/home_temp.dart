import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  HomePageTemp({super.key});

  final options = ['One', 'Two', 'Three', 'Four'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Temp Components"),
      ),
      body: ListView(children: _itemListToWidgetList()),
    );
  }

  List<Widget> _itemListToWidgetList() {
    //dinamic list constructor
    List<Widget> widgetsList = <Widget>[];
    for (var item in options) {
      var widget = Text(item);
      widgetsList.add(widget);
    }
    return widgetsList;
  }
}

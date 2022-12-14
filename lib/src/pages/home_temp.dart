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
      body: ListView(children: _itemListToWidgetListShortVersion()),
    );
  }

  List<Widget> _itemListToWidgetList() {
    //dinamic list constructor
    List<Widget> widgetsList = <Widget>[];
    for (String item in options) {
      var widget = ListTile(title: Text(item));
      // widgetsList.add(widget);
      // widgetsList.add(const Divider(color: Colors.blue,));
      widgetsList //cascade operator
        ..add(widget)
        ..add(const Divider(color: Colors.blue));
    }
    return widgetsList;
  }

  List<Widget> _itemListToWidgetListShortVersion() {
    //using the map operator
    return options.map((String item) {
      return Column(
        children: [
          ListTile(
            title: Text(item),
            subtitle: Text("a subtitle example"),
            leading: Icon(Icons.headphones), //first icon
            trailing: Icon(Icons.keyboard_arrow_right), //last icon
            onTap: () {}, //method on click on list item
          ),
          const Divider()
        ],
      );
    }).toList();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_widgets_party/src/pages/alert_page.dart';
import 'package:flutter_widgets_party/src/providers/menu_provider.dart';
import 'package:flutter_widgets_party/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Components list'),
      ),
      body: _componentsList(),
    );
  }

  Widget _componentsList() {
    return FutureBuilder(
      future: menuProvider.loadData(), //future that we are expecting to resolve
      initialData: [], //default info while future is not resolved
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        //it is executed few times:
        //when I am requesting data
        //when I retrive the data
        //when a fail happens

        print(snapshot.data);
        return ListView(
          children: _itemsList(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _itemsList(
      List<dynamic>? optionItemsList, BuildContext context) {
    final List<Widget> options = [];

    if (optionItemsList != null) {
      optionItemsList.forEach((item) {
        var tempWidget = ListTile(
          title: Text(item['texto']),
          leading: getIcon(item['icon']),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            //go to other route by name, defined in main.dart
            Navigator.pushNamed(context, item['ruta']);
          },
        );
        options
          ..add(tempWidget)
          ..add(Divider());
      });
    }

    return options;
  }
}

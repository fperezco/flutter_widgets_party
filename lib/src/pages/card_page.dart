import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cards Page")),
        body: ListView(
            children: <Widget>[_cardTipo1()], padding: EdgeInsets.all(20)));
  }

  Widget _cardTipo1() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text("card title"),
            subtitle: Text(
                "super text about this card title & balblablbal lorem ipsum"),
          ),
          Row(
            children: <Widget>[
              TextButton(onPressed: () {}, child: Text("Cancel")),
              TextButton(onPressed: () {}, child: Text("OK")),
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          )
        ],
      ),
    );
  }
}

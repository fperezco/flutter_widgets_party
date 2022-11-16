import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cards Page")),
        body: ListView(children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),          
        ], padding: EdgeInsets.all(20)));
  }

  Widget _cardTipo1() {
    return Card(
      //shades
      elevation: 5,
      //borders
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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

  _cardTipo2() {
    return Card(
      clipBehavior: Clip.antiAlias,
      //shades
      elevation: 5,
      //borders
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          //placeholder image in the device
          FadeInImage(
            placeholder: AssetImage('assets/image_loading.gif'), 
            image:  NetworkImage('https://images.pexels.com/photos/1619317/pexels-photo-1619317.jpeg'),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text("Picture footer"),
          )
        ],
      ),
    );
  }
}

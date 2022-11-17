import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar page"),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://decine21.com/img/upload/perfiles/clint-eastwood-6268/clint-eastwood-2-32318-c.jpg"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              child: Text("PP"),
              backgroundColor: Colors.purple,
            ),
          )
        ],
      ),
      body: Center(
          child: FadeInImage(
              fadeInDuration: Duration(milliseconds:200),
              placeholder: AssetImage('assets/image_loading.gif'),
              image: NetworkImage("https://imagenes.heraldo.es/files/og_thumbnail/uploads/imagenes/2013/10/31/_clinteastwood_303b882e.jpg"),
      )),
    );
  }
}

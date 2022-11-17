import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Inputs")),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: [
            _createInput(),
            Divider(),
            _createPerson()
          ],
        ));
  }

  Widget _createInput() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          counter: Text('characters: ${_name.length}'),
          hintText: "Introduce full name",
          helperText: "instructions down the input...",
          label: Text("Full name"),
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (value) {
        setState(() {
           _name = value;
           print(_name);
        });

      },
    );
  }
  
  Widget _createPerson() {
    return ListTile(
      title: Text("The name is: $_name"),
    );
  }
}

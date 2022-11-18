import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = "";
  String _email = "";
  String _password = "";
  String _date = "";

  // to manage a relationship between a var and an input
  TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Inputs")),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: [
            _createInput(),
            Divider(),
            _createEmail(),
            Divider(),
            _createPassword(),
            Divider(),
            _createDate(context),
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
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("The email is: $_email"),
          Text("The password is: $_password"),
        ],
      ),
    );
  }

  Widget _createEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: "Introduce email",
            helperText: "instructions about the email",
            label: Text("Email"),
            suffixIcon: Icon(Icons.alternate_email),
            icon: Icon(Icons.email)),
        onChanged: (value) => setState(() {
              _email = value;
              print(_email);
            }));
  }

  Widget _createPassword() {
    return TextField(
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: "Introduce password",
            helperText: "instructions about the password",
            label: Text("Password"),
            suffixIcon: Icon(Icons.lock_open),
            icon: Icon(Icons.lock)),
        onChanged: (value) => setState(() {
              _password = value;
              print(_password);
            }));
  }

  Widget _createDate(BuildContext context) {
    return TextField(
        controller:_inputFieldDateController, //asign the controller to the input
        enableInteractiveSelection: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: "Introduce birth date",
            helperText: "instructions about the date",
            label: Text("Birth date"),
            suffixIcon: Icon(Icons.calendar_today),
            icon: Icon(Icons.calendar_today)),
        onTap: () {
          FocusScope.of(context).requestFocus(
              new FocusNode()); //remove focus from element when click
          _selectDate(context);
        });
  }

  /** Launch the dialog to select date */
  void _selectDate(BuildContext context) async {
    DateTime? pickedDateTime = await showDatePicker(
        locale: Locale("es",'ES'),
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));

    if (pickedDateTime != null) {
      setState(() {
        _date = pickedDateTime.toString();
        _inputFieldDateController.text =
            _date; //to move the value to the input using the controller
      });
    }
  }
}

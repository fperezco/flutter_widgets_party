import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alerts page")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.backspace),
        onPressed: () => Navigator.pop(context)),
    );
  }
}

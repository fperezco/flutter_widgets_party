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
      body: Center(
          child: ElevatedButton(
        child: Text("Show alert"),
        onPressed: () => _showAlert(context),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, shape: StadiumBorder()),
      )),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 5.0,
            title: Text("Titulo"),
            content: Column(
              mainAxisSize:
                  MainAxisSize.min, //just the required sized,not the full one
              children: [
                Text("alert content balbalblbaabl"),
                FlutterLogo(size: 100.0),
              ],
            ),
            actions: [
              TextButton(child: Text("Cancel"), onPressed: () => Navigator.of(context).pop() ),
              TextButton(child: Text("Accept"),  onPressed: () => Navigator.of(context).pop() ),
            ],
          );
        });
  }
}

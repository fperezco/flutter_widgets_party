import 'package:flutter/material.dart';

//just follow tutorial way, there a better way now
//https://stackoverflow.com/questions/59854088/flutter-string-to-icon-value
final _icons = <String, IconData>{
  "add_alert": Icons.add_alert,
  "accessibility": Icons.accessibility,
  "folder_open": Icons.folder_open,
  "donut_large": Icons.donut_large,
  "input": Icons.input,
};

Icon getIcon(String iconName) {
  return Icon(_icons[iconName], color: Colors.blue,);
}

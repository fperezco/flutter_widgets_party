import 'package:flutter/material.dart';
import 'package:flutter_widgets_party/src/pages/home_temp.dart';

import 'src/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home:  HomePage(),
    );
  }
}
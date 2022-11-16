import 'package:flutter/material.dart';
import 'package:flutter_widgets_party/src/pages/alert_page.dart';
import 'package:flutter_widgets_party/src/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: getApplicationRoutes(), //moved to method on routes.dart
      //when the route is not previously defined
      //return a default page
      onGenerateRoute: ((RouteSettings settings) {
        return MaterialPageRoute(builder: (context) => AlertPage());
      }),
    );
  }
}

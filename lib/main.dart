import 'package:flutter/material.dart';
import 'package:flutter_widgets_party/src/pages/alert_page.dart';
import 'package:flutter_widgets_party/src/routes/routes.dart';

//for serveral languages
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //for different languages support
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('es', 'ES'), // Spanish, no country code
      ],
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

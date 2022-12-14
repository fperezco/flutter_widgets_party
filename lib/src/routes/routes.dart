import 'package:flutter/material.dart';
import 'package:flutter_widgets_party/src/pages/card_page.dart';
import 'package:flutter_widgets_party/src/pages/input_page.dart';
import 'package:flutter_widgets_party/src/pages/listview_page.dart';

import '../pages/alert_page.dart';
import '../pages/animated_container.dart';
import '../pages/avatar_page.dart';
import '../pages/home_page.dart';
import '../pages/slider_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(),
        'alert': (BuildContext context) => AlertPage(),
        'avatar': (BuildContext context) => AvatarPage(),
        'card': (BuildContext context) => CardPage(),
        'animated_container': (BuildContext context) => AnimatedContainerPage(),
        'inputs': (BuildContext context) => InputPage(),
        'sliders': (BuildContext context) => SliderPage(),
        'listview': (BuildContext context) => ListViewPage(),
      };
 }     
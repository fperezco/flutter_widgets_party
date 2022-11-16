import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List<dynamic> options = [];
  _MenuProvider() {
    loadData();
  }

  Future <List<dynamic>> loadData() async {
    //wait to the procedure...
    final dataFromFile = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(dataFromFile);
    options = dataMap['rutas'];
    return options;
  }
}

//only expose the var of this class
final menuProvider = new _MenuProvider();

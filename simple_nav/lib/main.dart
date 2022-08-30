import 'package:flutter/material.dart';


import 'ecran_accueil.dart';
import 'ecran_b.dart';

void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EcranAccueil(),
      routes: routes(),
    );
  }

  Map<String, WidgetBuilder> routes() {
    return {
      '/ecranb': (context) => EcranB(),
      '/accueil': (context) => EcranAccueil(),
    };
  }
}

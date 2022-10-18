import 'package:flutter/material.dart';
import 'Page1.dart';
import 'Page2.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      // TODO enregistrer les delegate pour la traduction
      // localizationsDelegates: [
      //   DemoDelegate(),
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // // TODO annoncer les locales qui sont gerees
      // supportedLocales: [
      //   const Locale('en'),
      //   const Locale('fr'),
      // ],

      //  title: 'Flutter Demo',

      home: Page1(),
      routes: routes(),

    );
  }

  Map<String, WidgetBuilder> routes() {
    return {
      '/page1': (context) => Page1(),
      '/page2': (context) => Page2(),
    };
  }
}
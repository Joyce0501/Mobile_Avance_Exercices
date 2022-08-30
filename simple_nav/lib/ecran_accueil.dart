
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'ecran_b.dart';

class EcranAccueil extends StatefulWidget {

  @override
  _EcranAccueilState createState() => _EcranAccueilState();
}

class _EcranAccueilState extends State<EcranAccueil> {

  String variable = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Accueil"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Ecris quelque chose puis clique sur le bouton',
          ),
          TextField(
              onChanged: (value)  {
                print("The value entered is : $value");
                variable = value;
               }
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/ecranb',
                arguments: variable,
              );
            },
            child: Text('Vers le prochain Ecran '),
          ),
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

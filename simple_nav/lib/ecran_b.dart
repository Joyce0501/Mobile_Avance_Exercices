

// TODO Un ecran qui peut accepter un parametre en utilisant le routage
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EcranB extends StatefulWidget {
// TODO on ne specifie pas le parametre ici, il sera lu juste avant le build

  @override
  _EcranBState createState() => _EcranBState();
}

class _EcranBState extends State <EcranB>{
  @override
  Widget build(BuildContext context) {
    // TODO lecture du parametre
    final la_valeur = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(

      // TODO widget. donne accès aux paramètres du widget
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Ecran B"),
      ),
      body: Text(la_valeur),
    );
  }

}

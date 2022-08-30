import 'package:flutter/material.dart';
import 'package:liste_nav/ecran_b.dart';
import 'package:liste_nav/ecran_accueil.dart';

class EcranB extends StatefulWidget {

  final String le_parametre;

  const EcranB({Key? key, required this.le_parametre}) : super(key: key);

  @override
  _EcranBState createState() => _EcranBState();
}

class _EcranBState extends State<EcranB> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO decommenter la ligne suivante
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Ecran A'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                  child:
                  Padding(
                      padding: EdgeInsets.all(5),
                      child:
                      ElevatedButton(
                        onPressed: () {

                          Navigator.of(context).pop();

                        },
                        child: Text('Retourner Ã  Ecran Accueil'),
                      )
                  )
              ),
              Expanded(
                  child:
                  Padding(
                      padding: EdgeInsets.all(5),
                      child:
                      Text(widget.le_parametre)
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}



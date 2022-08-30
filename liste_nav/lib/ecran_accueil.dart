import 'package:flutter/material.dart';

import 'ecran_b.dart';


class EcranAccueil extends StatefulWidget {

  @override
  _EcranAccueilState createState() => _EcranAccueilState();
}

class _EcranAccueilState extends State<EcranAccueil> {

  List<String> buttonsListName = [];
  List<ElevatedButton> buttonsList = [];

  @override
  void initState() {
    super.initState();
    for (int i = 1; i <=  10; i++) {
      buttonsListName.add('Truc ' + i.toString());
    }

    for (int i = 0; i <  buttonsListName.length; i++) {
      buttonsList.add(new
      ElevatedButton(
        onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EcranB(le_parametre: buttonsListName[i].toString()),
            ),
          );

        },
        child: Text(buttonsListName[i].toString()),
      )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO decommenter la ligne suivante
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: Column(
        children: buttonsList,
      ),
    );
  }
}
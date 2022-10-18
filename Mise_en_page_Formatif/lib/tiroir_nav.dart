import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mise_en_page_formatif/Page1.dart';
import 'package:mise_en_page_formatif/Page2.dart';

class LeTiroir extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => LeTiroirState();
}

class LeTiroirState extends State<LeTiroir> {

  @override
  void initState() {
    //  deconnexion();
  }


  @override
  Widget build(BuildContext context) {

    var listView = ListView(
      padding: EdgeInsets.zero,
      children:[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Joyce Nouteji',textAlign: TextAlign.left,),
        ),
        ListTile(
          dense: true,
          title: Text("Page 1"),
          onTap: () {
            // TODO ferme le tiroir de navigation
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Page1(),
              ),
            );
            // Then close the drawer
          },
        ),

        // TODO le tiroir de navigation ne peut pointer que vers des
        // ecran sans paramtre.
        ListTile(
          dense: true,
          title: Text("Page 2"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Page2(),
              ),
            );
            // Then close the drawer
          },
        ),
      ],
    );

    return Drawer(
      child: new Container(
        color: const Color(0xFFFFFFFF),
        child: listView,
      ),
    );
  }
}
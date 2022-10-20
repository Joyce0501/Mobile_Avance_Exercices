
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mise_en_page_formatif/tiroir_nav.dart';

class Page1 extends StatefulWidget {

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      drawer: LeTiroir(),
      appBar: AppBar(
        title: Text("Page 1",textAlign: TextAlign.center),
      ),
      // body: Column(
      //     children:[
      //       Expanded(child:
      //       Container(
      //         color: Colors.deepPurple,
      //       ),
      //       ),
      //       Expanded(child:
      //       Container(
      //         color: Colors.orange,
      //       ),
      //       ),
      //     ]
      // ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return buildPaysage();
          } else {
            return buildPortrait();
          }
        },
      ),
    );
  }

  Widget buildPortrait() {
    // TODO: implement build

    return Scaffold(
      drawer: LeTiroir(),
      // appBar: AppBar(
      //   title: Text("Page 1",textAlign: TextAlign.center,),
      // ),
      body: Column(
          children:[
            Expanded(child:
            Container(
              color: Colors.deepPurple,
            ),
            ),
            Expanded(child:
            Container(
              color: Colors.orange,
            ),
            ),
          ]
      ),
    );
  }

  Widget buildPaysage() {
    // TODO: implement build

    return Scaffold(
      drawer: LeTiroir(),
      // appBar: AppBar(
      //   title: Text("Page 1",textAlign: TextAlign.center,),
      // ),
      body: Row(
          children:[
            Expanded(child:
            Container(
              color: Colors.deepPurple,
            ),
            ),
            Expanded(child:
            Container(
              color: Colors.orange,
            ),
            ),
          ]
      ),
    );
  }

}
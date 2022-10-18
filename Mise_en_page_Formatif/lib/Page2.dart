import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mise_en_page_formatif/tiroir_nav.dart';

class Page2 extends StatefulWidget {

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      drawer: LeTiroir(),
      appBar: AppBar(
        title: Text("Page 2",textAlign: TextAlign.right)
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget> [
             TextFormField(
                  decoration: InputDecoration(labelText: "Entrez votre nom",
                      labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
              ),

            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      child: Text('Annuler'),
                      color: Colors.blue,
                      onPressed: () {  },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      child: Text('Sauvegarder'),
                      color: Colors.blue,
                      onPressed: () {  },
                    ),
                  ),
                ),
              ],
            ),
          ]
      ),
    );
  }

}
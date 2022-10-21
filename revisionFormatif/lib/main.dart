import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:revisionformatif/transfer.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String nomartiste = "";
  Truc truc = Truc();
  List<Truc> trucs = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void getHttpComplex(String nomartiste) async {
    try {
      var response = await Dio().get('http://ws.audioscrobbler.com/2.0/'
          '?method=artist.gettopalbums&api_key=9a8a3facebbccaf363bb9fd68fa37abf&format=json&artist='+nomartiste);

      var responseBody = response.data;
      // json = jsonDecode(responseBody['topalbums']['album']);
      print(responseBody['topalbums']['album']);
      var listeJSON = responseBody['topalbums']['album'] as List;
      var listeTruc = listeJSON.map(
              (elementJSON) {
            return Truc.fromJson(elementJSON);
          }
      ).toList();
      this.trucs =  listeTruc;
      print(listeTruc);
      setState(() {});
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Erreur reseau')
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
      Column(
        children: <Widget>[
          const Text(
            'Ecris quelque chose puis clique sur le bouton',
          ),
          TextField(
              onChanged: (valueArtiste)  {
                nomartiste = valueArtiste;
              }
          ),

          Expanded(
            // color: Colors.red,
            // height: 200,
            //width: 200,
            child: ListView.builder(
              itemCount: trucs.length,
              scrollDirection: Axis.vertical,

              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text( this.trucs[index].name.toString(),
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            //      color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: ListTile(
                        title: Text( this.trucs[index].playcount.toString(),
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            //      color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getHttpComplex(nomartiste);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

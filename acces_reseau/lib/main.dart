import 'package:acces_reseau/transfer.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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

  Truc truc = Truc();

  List<Truc> trucs = [];

  String annee = "";

  String mois = "";

  String jour = "";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void getHttpComplex(String annee, String mois, String jour) async {
    try {
      var response = await Dio().get('https://exercices-web.herokuapp.com/exam/'+annee + "/"+mois + "/"+jour);
      print(response);
      var listeJSON = response.data as List;
      var listeTruc = listeJSON.map(
              (elementJSON) {
            return Truc.fromJson(elementJSON);
          }
      ).toList();
      this.trucs =  listeTruc;
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:
      Column(
      children: <Widget>[
        const Text(
          'Ecris quelque chose puis clique sur le bouton',
        ),
        TextField(
            onChanged: (valueAnnee)  {
              annee = valueAnnee;
            }
        ),
        TextField(
            onChanged: (valueMois)  {
              mois = valueMois;
            }
        ),
        TextField(
            onChanged: (valueJour)  {
              jour = valueJour;
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
                      title: Text( this.trucs[index].jour.toString(),
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
                      title: Text( this.trucs[index].mois.toString(),
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
                      title: Text( this.trucs[index].annee.toString(),
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
                      title: Text( this.trucs[index].jourDeLaSemaine,
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
          getHttpComplex(annee,mois,jour);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

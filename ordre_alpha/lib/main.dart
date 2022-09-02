import 'dart:math';

import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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

  List<String> prenoms = ["Joyce","Celia","Ivan","Jordan","Pierre"];
  // int indexcourant = prenoms.indexOf(prenoms[index]),
  //     int indexprochain = prenoms.indexOf(prenoms[index + 1]),

  void _incrementCounter() {
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    prenoms.shuffle(Random());
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      // body: ListView.builder(
      //   itemCount: prenoms.length,
      //   prototypeItem: ListTile(
      //     title: Text(prenoms.first),
      //   ),
      //   itemBuilder: (context, index) {
      //     return Row(
      //       children: [
      //         Expanded(
      //           child: ListTile(
      //             title: Text(prenoms[index]),
      //           ),
      //         ),
      //         Expanded(
      //           child: MaterialButton(
      //             child: Text('en haut'),
      //             color: Colors.blue,
      //             onPressed: () {  },
      //           ),
      //         ),
      //         Expanded(
      //           child: MaterialButton(
      //             child: Text('en bas'),
      //             color: Colors.blue,
      //             onPressed: () {  },
      //           ),
      //         ),
      //       ],
      //     );
      //   },
      // )

      // AIDE DE MARIUS
      
      body:
      Center(
        child: ListView.builder(
          itemCount: prenoms.length,
            prototypeItem: ListTile(
              title: Text(prenoms.first),
            ),
            itemBuilder: (context,index){
              return ListTile(
              leading: IconButton(icon: const Icon(Icons.upload_rounded), onPressed: () {
                if(prenoms.indexOf(prenoms[index]) != 0){
                  setState((){
                    int indexcourant = prenoms.indexOf(prenoms[index]);
                    int indexenhaut = prenoms.indexOf(prenoms[index - 1]);
                    String wait = prenoms[index-1];
                    prenoms[indexenhaut] = prenoms[indexcourant];
                    prenoms[indexcourant] = wait;
                  });
                }
              }),
              title: Text(prenoms[index]),
                trailing: IconButton(icon: const Icon(Icons.download_for_offline), onPressed: () {
                  if(prenoms.indexOf(prenoms[index]) != prenoms.length - 1){
                    setState((){
                      int indexcourant = prenoms.indexOf(prenoms[index]);
                      int indexenbas = prenoms.indexOf(prenoms[index + 1]);
                      String wait = prenoms[index+1];
                      prenoms[indexenbas] = prenoms[indexcourant];
                      prenoms[indexcourant] = wait;
                    });
                  }
                }),
              );
            }
        ),
      ),
      );
  }
}

import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

  // int fibonacci(int n) => n <= 2 ? 1 : fibonacci(n - 2) + fibonacci (n - 1);
  //
  //   String output = "";
  //   String valeur = "";
  //
  //   for (int i = 1; i <= 16; ++i) {
  //     output += fibonacci(i).toString() + ", ";
  //   }
  //   print(output + "...");

    //
    // int n1=0,n2=1,n3;
    // print(n1);
    // print(n2);
    //
    // for(int i = 2 ;i <= 16; i++){
    //   n3 = n1+n2;
    //   print('$n3');
    //   n1 = n2;
    //   n2 = n3;
    // }

}

class MyApp extends StatelessWidget {
 // const MyApp({Key? key}) : super(key: key);



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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;
  String valeur = "";

  List<int>listeFibonacci = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _finobacci(){
    listeFibonacci = [];
    int fn1=0,fn2=1,fn3;
    listeFibonacci.add(fn1);
    listeFibonacci.add(fn2);

    for(int i = 2 ;i <= 16; i++){
      fn3 = fn1+fn2;

      listeFibonacci.add(fn3);
      fn1 = fn2;
      fn2 = fn3;
    }

  }

  @override
  void initState() {
    _finobacci();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),

      ),
      body: ListView.builder(
        itemCount: listeFibonacci.length,
        itemBuilder: (context,index) {
          return Container(
            padding: const EdgeInsets.all(20.0),
            margin:  const EdgeInsets.all(20.0),
            color: Colors.amber,
            child: ListTile(
              title: Text(listeFibonacci[index].toString())
            ),
          );
        }
      )
    );
  }
}

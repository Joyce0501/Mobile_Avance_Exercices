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

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
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
      body: Container(
      color: Colors.black12,
      //height: 500.0,
      child: ListView(
      scrollDirection: Axis.vertical,
      children: <Widget> [

            Container(
              color: Colors.green,
              height: 200,
              padding: const EdgeInsets.all(200.0),
            ),



            Container(
              color: Colors.white,
              height: 200,
            ),


        // Container(
        //   color: Colors.red,
        //   height: 200,
        // ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: Colors.red,
                height: 200,
              ),
            ),


            Container(
              color: Colors.yellow,
              height: 200,
            ),


            Container(
              color: Colors.lightBlue,
              height: 200,
              padding: const EdgeInsets.all(20.0),
            ),



            Container(
              color: Colors.black,
              height: 200,
            ),


            Container(
              color: Colors.teal,
              height: 200,
            ),



            Container(
              color: Colors.purple,
              height: 200,
            ),



            Container(
              color: Colors.tealAccent,
              height: 200,
            ),


            Container(
              color: Colors.orange,
              height: 200,
            ),

          ],
    ),
      ),
      );
  }
}
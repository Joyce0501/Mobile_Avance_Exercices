import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  String imagePath = "";

  void getImage() async {
    ImagePicker picker = ImagePicker();
    var pickedImage = await picker.pickImage(source : ImageSource.gallery);
    imagePath = pickedImage!.path;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:(imagePath == "") ?

         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(('Connexion'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
            Padding(
              padding: const EdgeInsets.all(50),
              child: TextFormField(
                  decoration: InputDecoration(labelText: ('Nom'),
                      labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.grey
                        ),
                      )),
              ),
            ),
            // const Text(
            //   'Mot de passe',
            // ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: TextFormField(
                  decoration: InputDecoration(labelText: ('Mot de passe'),
                      labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.grey
                        ),
                      )),
                  obscureText: true,
              ),
            ),
          ],
        )
      :

      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(File(imagePath)),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(('Connexion'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
            Padding(
              padding: const EdgeInsets.all(50),
              child: TextFormField(
                decoration: InputDecoration(labelText: ('Nom'),
                    labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.grey
                      ),
                    )),
              ),
            ),
            // const Text(
            //   'Mot de passe',
            // ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: TextFormField(
                decoration: InputDecoration(labelText: ('Mot de passe'),
                    labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.grey
                      ),
                    )),
                obscureText: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

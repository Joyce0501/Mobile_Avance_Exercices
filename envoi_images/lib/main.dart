import 'dart:io';

import 'package:dio/dio.dart';
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

  String imagePath = "";
  String imageNetworkPath = "";
  // XFile? pickedImage;
  List<XFile?>? pickedImages = [];
  List<String> idImage = [];

  void getImage() async {
    ImagePicker picker = ImagePicker();
    //pickedImage = await picker.pickImage(source : ImageSource.gallery);
    pickedImages = await picker.pickMultiImage();
  //  imagePath = pickedImage!.path;
    saveImages();
  //  setState(() {});
  }

  void saveImages() async {
    for(int i = 0; i <= pickedImages!.length - 1; i++){
      postOneImage(pickedImages![i]);
    }
  }

  void postOneImage(XFile? pickedImage) async {
    FormData formData = FormData.fromMap({
      "file" : await MultipartFile.fromFile(pickedImage!.path, filename: pickedImage!.name)
    });
    Dio dio = Dio();
    var response = await dio.post("http://10.0.2.2:8080/singleFile",data: formData);
    idImage.add(response.data);

    // String id = response.data as String;

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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
        children: this.idImage.map(
            (i) {
              return Image.network("http://10.0.2.2:8080/singleFile/" + i);
            }
          ).toList(),
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

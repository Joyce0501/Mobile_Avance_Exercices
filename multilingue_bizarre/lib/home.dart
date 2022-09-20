import 'package:flutter/material.dart';
import 'package:multilingue_bizarre/i18n/intl_localization.dart';

/*void main() {
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
}*/

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          // Expanded(
          //   child: Column(
          //     children: [
          //       Text(
          //        'Mes sortes de chats préférés',
          //    ),
          //     ],
          //   ),
          // ),
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            title:  Text(Locs.of(context).trans('TITLE1')),
                          ),
                          Image.asset('assets/images/chien1.jpg'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            title:  Text(Locs.of(context).trans('TITLE2')),
                          ),
                          Image.asset('assets/images/chat1.jpg'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            title:  Text(Locs.of(context).trans('TITLE3')),
                          ),
                          Image.asset('assets/images/chien2.jpg'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            title:  Text(Locs.of(context).trans('TITLE4')),
                          ),
                          Image.asset('assets/images/chat2.jpg'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

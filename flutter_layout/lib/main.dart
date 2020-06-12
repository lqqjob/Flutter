import 'package:flutter/material.dart';
import 'package:flutterlayout/root_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootPage(),
      theme: ThemeData(
        primaryColor: Colors.grey,
        highlightColor: Color.fromARGB(0, 0, 0, 0),
        splashColor: Color.fromARGB(0,0 ,0 , 0),
        cardColor: Color.fromRGBO(1, 1, 1, 0.65),
      ),
    );
  }
}


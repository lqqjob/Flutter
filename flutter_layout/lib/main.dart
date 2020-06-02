import 'package:flutter/material.dart';
import 'package:flutterlayout/root_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(

        primaryColor: Colors.grey,
        highlightColor: Color.fromARGB(0, 0, 0, 0),
        splashColor: Color.fromARGB(0,0 ,0 , 0),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body:RootPage(),
    );
  }
}

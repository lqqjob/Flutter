import 'dart:convert';
import 'package:flutter/material.dart';
import 'user.dart';

class JsonToDartModel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JsonToDartModel();
  }
}

class _JsonToDartModel extends State<JsonToDartModel> {
 
 static String jsonStr = '[{"name":"Jack"},{"name":"Rose"}]';
 List items = json.decode(jsonStr);

  @override
  Widget build(BuildContext context) {
    print(items[1]["name"]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Json转Dart Model类"),
      ),
    );
  }
}

import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileOperationRoute extends StatefulWidget {
  FileOperationRoute({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _FileOperationRouteState();
  }
}

class _FileOperationRouteState extends State<FileOperationRoute> {
  int _counter = 0;
  @override
  void initState() {
    super.initState();
    //从文件读取点击次数
    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    print("$dir");
    return new File('$dir/counter.text');
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();

      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> _incrementCounter() async {
    print("ddddd");
    setState(() {
      _counter++;
    });

    await (await _getLocalFile()).writeAsString('$_counter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文件操作"),
      ),
      body: new Center(
        child: new Text("点击了 $_counter 次"),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: new Icon(Icons.add),
      ),
    );
  }
}

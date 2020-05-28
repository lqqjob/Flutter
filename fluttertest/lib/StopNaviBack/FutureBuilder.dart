import 'package:flutter/material.dart';

class FutureBuilderRoute extends StatefulWidget {
  @override
  _FutureBuilderRouteState createState() {
    return new _FutureBuilderRouteState();
  }
}

class _FutureBuilderRouteState extends State<FutureBuilderRoute> {
  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuild"),
      ),
      body: Center(
        child: FutureBuilder(
          future: mockNetworkData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text("Error:${snapshot.error}");
              } else {
                return Text("content:${snapshot.data}");
              }
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

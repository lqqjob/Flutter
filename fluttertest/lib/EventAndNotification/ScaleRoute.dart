import 'package:flutter/material.dart';

class ScaleRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaleRouteState();
  }
}

class _ScaleRouteState extends State<ScaleRoute> {
  double _width = 300.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("缩放"),
      ),
      body: Center(
        child: GestureDetector(
          child: Image.asset(
            "./images/baoma.jpg",
            width: _width,
          ),
          onScaleUpdate: (ScaleUpdateDetails e) {
            setState(() {
              _width = 300 * e.scale.clamp(.8, 10);
            });
          },
        ),
      ),
    );
  }
}

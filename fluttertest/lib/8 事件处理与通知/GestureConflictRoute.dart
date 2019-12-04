import 'package:flutter/material.dart';

class GestureConflictRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GestureConflictRouteState();
  }
}

class _GestureConflictRouteState extends State<GestureConflictRoute> {
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("手势冲突"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
              left: _left,
              top: 80,
              child: Listener(
                onPointerDown: (details) {
                  print("Down");
                },
                onPointerUp: (details) {
                  print("up");
                },
                child: GestureDetector(
                  child: CircleAvatar(
                    child: Text("A"),
                  ),
                  onHorizontalDragUpdate: (DragUpdateDetails details) {
                    setState(() {
                      _left += details.delta.dx;
                    });
                  },
                  onHorizontalDragEnd: (DragEndDetails details) {
                    print("onHorizontalDragEnd");
                  },
                ),
              )),
        ],
      ),
    );
  }
}

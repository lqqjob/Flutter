import 'package:flutter/material.dart';

class BothDirectionRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BothDirectionRoute();
  }
}

class _BothDirectionRoute extends State<BothDirectionRoute> {
  double _top = 100.0;
  double _left = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势竞争"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("A"),
              ),
              onVerticalDragUpdate: (DragUpdateDetails e) {
                setState(() {
                  _top += e.delta.dy;
                });
              },
              onHorizontalDragUpdate: (DragUpdateDetails e) {
                setState(() {
                  _left += e.delta.dx;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

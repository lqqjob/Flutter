import 'package:flutter/material.dart';

class Drag extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DragState();
  }
}

class _DragState extends State<Drag> with SingleTickerProviderStateMixin {
  double _top = 0.0;
  double _left = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("拖动、滑动(任意方向)"),
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
              onPanDown: (DragDownDetails e) {
                print("用户手指按下${e.globalPosition}");
              },
              onPanUpdate: (DragUpdateDetails e) {
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e) {
                print(e.velocity);
              },
            ),
          ),
        ],
      ),
    );
  }
}

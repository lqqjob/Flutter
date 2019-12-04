import 'package:flutter/material.dart';

class DragValticalRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DragValticalState();
  }
}

class _DragValticalState extends State<DragValticalRoute> {
  double _top = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("单一方向拖动"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: 100,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("A"),
              ),
              onVerticalDragUpdate: (DragUpdateDetails e) {
                setState(() {
                  _top += e.delta.dy;
                });
              },
              // onHorizontalDragUpdate: (DragUpdateDetails e) {
              //   setState(() {
              //     _top += e.delta.dx;
              //   });
              // },
  
            ),
          ),
        ],
      ),
    );
  }
}

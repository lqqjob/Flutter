import 'package:flutter/material.dart';
import 'AnimatedDecorationBox1.dart';

class OverAnimationComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OverAnimationComponentState();
  }
}

class _OverAnimationComponentState extends State<OverAnimationComponent> {
  Color _decotationColor = Colors.blue;
  var duration = Duration(seconds: 1);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("动画过度组件"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AnimationDecoratedBox1(
            duration: duration,
            decoration: BoxDecoration(color: _decotationColor),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  _decotationColor = Colors.red;
                });
              },
              child: Text(
                "AnimatedDecoratedBox",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

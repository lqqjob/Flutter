import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";

class GestureRecognizerRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GestureRecognizerRouteState();
  }
}

class _GestureRecognizerRouteState extends State<GestureRecognizerRoute> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false;

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势"),
      ),
      body: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: "你好世界"),
            TextSpan(
                text: "点我变色",
                style: TextStyle(
                    fontSize: 30, color: _toggle ? Colors.blue : Colors.red),
                recognizer: _tapGestureRecognizer
                  ..onTap = () {
                    setState(() {
                      _toggle = !_toggle;
                    });
                  }),
            TextSpan(text: "你好世界")
          ],
        ),
      ),
    );
  }
}

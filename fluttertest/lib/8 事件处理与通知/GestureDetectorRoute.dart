import 'package:flutter/material.dart';

class GestureDetectorRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GestureDetectorRouteState();
  }
}

class _GestureDetectorRouteState extends State<GestureDetectorRoute> {
  String _operation = "No Gesture detected";
  void updateText(String text) {
    setState(() {
      _operation = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("点击、双击、长按"),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200,
            height: 100,
            child: Text(
              _operation,
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () => updateText("Tap"),
          onDoubleTap: () => updateText("DoubleTap"),
          onLongPress: () => updateText("onLongPress"),
        ),
      ),
    );
  }
}

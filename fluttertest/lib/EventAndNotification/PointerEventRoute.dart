import 'package:flutter/material.dart';

class PointerEventRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PointEventRouteState();
  }
}

class _PointEventRouteState extends State<PointerEventRoute> {
  PointerEvent _event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("原是指针事件处理"),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 26),
              child: Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(300, 150)),
                  child: Center(
                    child: Text(
                      "Box A",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                onPointerDown: (event) => print("down A"),
                // onPointerMove: (PointerMoveEvent event) => setState(()=>_event = event),
                // onPointerUp: (PointerUpEvent event) => setState(()=>_event = event),
                behavior: HitTestBehavior.deferToChild,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 26),
              child: Stack(
                children: <Widget>[
                  Listener(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(300, 200)),
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.blue),
                      ),
                    ),
                    onPointerDown: (event) {
                      print("down 0");
                    },
                  ),
                  Listener(
                    child: ConstrainedBox(
                        constraints: BoxConstraints.tight(Size(200, 100)),
                        child: Center(
                          child: Text("左上角200*100范围内非文本区域点击"),
                        )),
                    onPointerDown: (event) {
                      print("down 1");
                    },
                    behavior: HitTestBehavior.translucent,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 26),
              child: Listener(
                child: AbsorbPointer(
                  child: Listener(
                    child: Container(
                      color: Colors.red,
                      width: 200.0,
                      height: 100.0,
                    ),
                    onPointerDown: (event) => print("in"),
                  ),
                ),
                onPointerDown: (event) => print("up"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 26),
              child: Listener(
                child: IgnorePointer(
                  child: Listener(
                    child: Container(
                      color: Colors.red,
                      width: 200.0,
                      height: 100.0,
                    ),
                    onPointerDown: (event) => print("in"),
                  ),
                ),
                onPointerDown: (event) => print("up"),
              ),
            ),
          ],
        ));
  }
}

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'AnimationDecoratedBox1.dart';

class OverAnimationComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OverAnimationComponentState();
  }
}

class _OverAnimationComponentState extends State<OverAnimationComponent> {
  Color _decorationColor = Colors.blue;
  var duration = Duration(seconds: 5);
  double _padding = 20;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _style = TextStyle(color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画过度组件"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            AnimationDecoratedBox1(
              duration: duration,
              decoration: BoxDecoration(color: _decorationColor),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    _decorationColor = Colors.red;
                  });
                },
                child: Text(
                  "AnimatedDecoratedBox1",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            AnimatedDecoratedBox(
              duration: duration,
              decoration: BoxDecoration(color: _decorationColor),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    _decorationColor = Colors.yellow;
                  });
                },
                child: Text(
                  "AnimatedDecoratedBox",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            AnimatedDecoratedBox(
              duration: Duration(
                  milliseconds: _decorationColor == Colors.red ? 400 : 2000),
              decoration: BoxDecoration(color: _decorationColor),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    _decorationColor = _decorationColor == Colors.blue
                        ? Colors.red
                        : Colors.blue;
                  });
                },
                child: Text(
                  "AnimatedDecoratedBox toggle",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            //系统预置的动画过渡组件效果：

            RaisedButton(
              onPressed: () {
                setState(() {
                  _padding = 20;
                });
              },
              child: AnimatedPadding(
                duration: duration,
                padding: EdgeInsets.all(_padding),
                child: Text("AnimatedPadding"),
              ),
            ),

            SizedBox(
              height: 50,
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    duration: duration,
                    left: _left,
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _left = 100;
                        });
                      },
                      child: Text("AnimatedPositioned"),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 100,
              color: Colors.grey,
              child: AnimatedAlign(
                duration: duration,
                alignment: _align,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      _align = Alignment.center;
                    });
                  },
                  child: Text("AnimatedAlign"),
                ),
              ),
            ),

            AnimatedContainer(
              duration: duration,
              height: _height,
              color: _color,
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    _height = 150;
                    _color = Colors.blue;
                  });
                },
                child: Text(
                  "AnimatedContainer",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            AnimatedDefaultTextStyle(
              style: _style,
              duration: duration,
              child: GestureDetector(
                child: Text("hello world"),
                onTap: () {
                  setState(() {
                    _style = TextStyle(
                      color: Colors.blue,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Colors.blue,
                      fontSize: 50.0,
                    );
                  });
                },
              ),
            ),
          ].map((e) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: e,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
  AnimatedDecoratedBox({
    Key key,
    @required this.decoration,
    this.child,
    Curve curve = Curves.linear,
    @required Duration duration,
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
        );

  final BoxDecoration decoration;
  final Widget child;
  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return _AnimatedDecoratedBoxState();
  }
}

class _AnimatedDecoratedBoxState
    extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {
  DecorationTween _decoration; //定义一个Tween

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decoration.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    // 在需要更新Tween时，基类会调用此方法
    _decoration = visitor(_decoration, widget.decoration,
        (value) => DecorationTween(begin: value));
  }
}

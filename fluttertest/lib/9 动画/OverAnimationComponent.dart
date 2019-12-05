import 'package:flutter/material.dart';
import 'AnimationDecoratedBox1.dart';

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
          AnimatedDecoratedBox1(
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

class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
  AnimatedDecoratedBox({
    Key key,
    @required this.decoration,
    this.child,
    Curve curve = Curves.linear,
    @required Duration duration,
    Duration reverseDuration,
    }):super(
      key:key,
      curve:curve,
      duration:duration,
    );

    final BoxDecoration decoration;
    final Widget child;
    @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    // TODO: implement createState
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
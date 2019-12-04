import 'package:flutter/material.dart';

class AnimationDecoratedBox1 extends StatefulWidget {
  AnimationDecoratedBox1({
    Key key,
    @required this.decoration,
    this.child,
    this.curve,
    @required this.duration,
    this.reverseDuration,
  });

  final BoxDecoration decoration;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration reverseDuration;

  @override
  State<StatefulWidget> createState() {
    return _AnimationDecoratedBox1State();
  }
}

class _AnimationDecoratedBox1State extends State<AnimationDecoratedBox1>
    with SingleTickerProviderStateMixin {
  AnimationController get controller => _controller;
  AnimationController _controller;
  Animation<double> get animation => _animation;
  Animation<double> _animation;
  DecorationTween _tween;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return DecoratedBox(
          decoration: _tween.animate(_animation).value,
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
      vsync: this,
    );
    _tween = DecorationTween(begin: widget.decoration);
    _updateCurve();
  }

  void _updateCurve() {
    if (widget.curve != null) {
      _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    } else {
      _animation = _controller;
    }
  }

  @override
  void didUpdateWidget(AnimationDecoratedBox1 oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.curve != oldWidget.curve) {
      _updateCurve();
      _controller.duration = widget.duration;
      _controller.reverseDuration = widget.reverseDuration;
      if (widget.decoration != (_tween.end ?? _tween.begin)) {
        _tween
          ..begin = _tween.evaluate(_animation)
          ..end = widget.decoration;
        _controller
          ..value = 0.0
          ..forward();
      }
    }
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();    
  }

  
}

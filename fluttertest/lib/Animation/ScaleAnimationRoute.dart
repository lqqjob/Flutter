import 'package:flutter/material.dart';

class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Image.asset(
        "images/baoma.jpg",
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});
  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (BuildContext context, Widget child) {
          return new Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
      ),
    );
  }
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    // ..addListener(() {
    //   setState(() => {});
    // });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画结构"),
      ),
      // body:AnimatedImage(animation:animation),
      // body: AnimatedBuilder(
      //   animation: animation,
      //   child: Image.asset("images/baoma.jpg"),
      //   builder: (BuildContext context,Widget child) {
      //     return new Center(
      //       child: Container(
      //         height: animation.value,
      //         width: animation.value,
      //         child: child,
      //       ),
      //     );
      //   },
      // ),
      body: GrowTransition(
        child: Image.asset("images/baoma.jpg"),
        animation: animation,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

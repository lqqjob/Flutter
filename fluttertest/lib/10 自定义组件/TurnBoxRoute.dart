import 'package:flutter/material.dart';

class TurnBox extends StatefulWidget {
  TurnBox({
    Key key,
    this.turns = 0,
    this.speed = 200,
    this.child,
  }) : super(key: key);

  final double turns;
  final int speed;
  final Widget child;
  @override
  State<StatefulWidget> createState() {
    return _TurnBoxState();
  }
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
      vsync: this,
      lowerBound: -double.infinity,
      upperBound: double.infinity,
    );
    _animationController.value = widget.turns;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animationController,
      child: widget.child,
    );
  }
  @override
  void didUpdateWidget(TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.turns != widget.turns) {
      _animationController.animateTo(
        widget.turns,
        duration: Duration(milliseconds: widget.speed??200),
        curve: Curves.easeInOut,
      );
    }
  }
}

class TurnBoxRoute extends StatefulWidget {
@override
  State<StatefulWidget> createState() {
   return _TurnBoxRouteState(); 
  }
}

class _TurnBoxRouteState extends State <TurnBoxRoute> {
double _turns = .0;

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("组合实例"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TurnBox(
            child:Icon(Icons.refresh,size: 50,),
            speed: 500,
            turns: _turns,
            ),
            TurnBox(
            child:Icon(Icons.refresh,size: 150,),
            speed: 2500,
            turns: _turns,
            ),
            RaisedButton(
            child: Text("顺时针旋转1/5圈"),
            onPressed: () {
              setState(() {
                _turns += .2;
              });
            },
          ),
          RaisedButton(
            child: Text("逆时针旋转1/5圈"),
            onPressed: () {
              setState(() {
                _turns -= .2;
              });
            },
          ),
          ],
        ),
      ),
    );
  }
}

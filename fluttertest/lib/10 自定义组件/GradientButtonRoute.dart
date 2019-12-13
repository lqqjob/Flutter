import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.onPress,
    this.borderRadius,
    @required this.child,
  });

  final List<Color> colors;
  final double width;
  final double height;
  final Widget child;
  final BorderRadius borderRadius;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: borderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPress,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GrandientButtonRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GrandientButtonsRoute();
  }
}

class _GrandientButtonsRoute extends State<GrandientButtonRoute> {
  @override
  Widget build(BuildContext context) {
    onTap() {
      print("Button Click");
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("组和现有组件"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            GradientButton(
              colors: [Colors.orange, Colors.red],
              height: 50,
              child: Text("Submit"),
              onPress: onTap,
            ),
            GradientButton(
              colors: [Colors.lightGreen, Colors.green[700]],
              height: 50,
              child: Text("Submit"),
              onPress: onTap,
            ),
            GradientButton(
              height: 50,
              colors: [Colors.lightBlue[300], Colors.lightBlueAccent],
              child: Text("Submit"),
              onPress: onTap,
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  final int data;

  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
    // return context.ancestorInheritedElementForWidgetOfExactType(ShareDataWidget).widget;
  }

  @override
  bool updateShouldNotify(ShareDataWidget old) {
    return old.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() {
    return new _TestWidgetState();
  }
}

class _TestWidgetState extends State<_TestWidget> {
  Widget build(BuildContext context) {
    return Text(
      ShareDataWidget.of(context).data.toString(),
      style: TextStyle(fontSize: 20, color: Colors.cyan),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Dependences change");
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  _InheritedWidgetTestRouteState createState() =>
      _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("数据共享"),
      ),
      body: Center(
        child: ShareDataWidget(
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: _TestWidget(),
              ),
              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                child: Text(
                  "Increment",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  setState(() {
                    ++count;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

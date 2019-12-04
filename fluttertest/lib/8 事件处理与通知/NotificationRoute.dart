import 'package:flutter/material.dart';



class NotificationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _NotificationRouteState();
  }
}

class _NotificationRouteState extends State<NotificationRoute> {
  String _msg = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notification"),
        ),
        body: NotificationListener<MyNotification>(
          onNotification: (MyNotification notification) {
            print(notification.msg);
            return false;
          },
          child: NotificationListener(
            onNotification: (MyNotification notification) {
              setState(() {
                _msg += notification.msg + "  ";
              });

              return true;// 阻止冒泡
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Builder(
                    builder: (context) {
                      return RaisedButton(
                        onPressed: () {
                         new MyNotification("Hi").dispatch(context);
                        },
                        child: Text("Send Notication"),
                      );
                    },
                  ),
                  Text(_msg)
                ],
              ),
            ),
          ),
        ));
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);
  final  msg;
}

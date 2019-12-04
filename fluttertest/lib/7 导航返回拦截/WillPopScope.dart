import 'package:flutter/material.dart';

class WillPopScopeTestRoute extends StatefulWidget {
  @override 
  WillPopScopeTestRouteState createState() {
    return new WillPopScopeTestRouteState();
  }
}

class WillPopScopeTestRouteState extends State <WillPopScopeTestRoute> {
  DateTime _lastPressedAt;
  
  @override 
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        if(_lastPressedAt == null) {
          _lastPressedAt = DateTime.now();
          return false;
        }else {
           Duration difference = DateTime.now().difference(_lastPressedAt);
           print("$difference");
           if (difference > Duration(seconds: 1)) {
             _lastPressedAt = DateTime.now();
             return false;
           }else {
             return true;
           }
        }
      },
      child: Scaffold(
      appBar: AppBar(
        title: Text("导航返回拦截"),
      ),
      body: Center(
        
      ),
    ),

    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutterlayout/Const.dart';
class FriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WechatThemeColor,
        title: Text('通讯录',style: TextStyle(fontSize: 18),),
        elevation: 0,
      ),
      body: Center(
        child: Text('通讯录'),
      ),
    );
  }
}

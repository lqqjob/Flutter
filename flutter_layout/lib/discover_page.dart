import 'package:flutter/material.dart';
import 'package:flutterlayout/Const.dart';
import 'package:flutterlayout/discover/discover_cell.dart';


class DisCoverPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<DisCoverPage>  with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WechatThemeColor,
        title: Text(
          '发现',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: WechatThemeColor,
        child: ListView(
          children: <Widget>[
            DiscoverCell(
              imageName: 'images/朋友圈.png',
              title: '朋友圈',
              showBottomLine: false,
            ),
            SizedBox(
              height: 10,
            ),
            DiscoverCell(
              imageName: 'images/扫一扫.png',
              title: '扫一扫',
              subTitle: '扫一扫',
              showBottomLine: true,
            ),
            DiscoverCell(
              imageName: 'images/摇一摇.png',
              title: '摇一摇',
              showBottomLine: false,
            ),
            SizedBox(
              height: 10,
            ),
            DiscoverCell(
              imageName: 'images/看一看icon.png',
              title: '看一看',
              showBottomLine: true,
            ),
            DiscoverCell(
              imageName: 'images/搜一搜.png',
              title: '搜一搜',
              showBottomLine: false,
            ),
            SizedBox(
              height: 10,
            ),
            DiscoverCell(
              imageName: 'images/附近的人icon.png',
              title: '附近的人',
              showBottomLine: false,
            ),
            SizedBox(
              height: 10,
            ),
            DiscoverCell(
              imageName: 'images/购物.png',
              title: '购物',
              showBottomLine: true,
            ),
            DiscoverCell(
              imageName: 'images/游戏.png',
              title: '游戏',
              showBottomLine: false,
            ),
            SizedBox(
              height: 10,
            ),
            DiscoverCell(
              imageName: 'images/小程序.png',
              title: '小程序',
              showBottomLine: false,
            ),
          ],
        ),
      ),
    );
  }
}




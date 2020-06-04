import 'package:flutter/material.dart';
import 'package:flutterlayout/Const.dart';
import 'package:flutterlayout/discover/discover_cell.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _headWidget() {
      return Container(
        color: Colors.white,
        height: 200,
        padding: EdgeInsets.fromLTRB(15, 95, 15, 40),
        child: Container(
          child: Row(
            children: <Widget>[
              Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('images/IMG_0085.JPG'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
//                color: Colors.blue,
                height: 75,
                width: ScreenWidth(context) - 30 - 75 - 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Ran',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
//                      color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text(
                              '微信号：mlq322',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: true,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            child: Image.asset(
                              'images/icon_right.png',
                              height: 15,
                              width: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        body: Container(
      color: WechatThemeColor,
      child: Stack(
        children: <Widget>[
          Container(
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView(
                children: <Widget>[
                  _headWidget(),
                  SizedBox(
                    height: 10,
                  ),
                  DiscoverCell(
                    imageName: 'images/微信 支付.png',
                    title: '支付',
                    showBottomLine: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DiscoverCell(
                    imageName: 'images/微信收藏.png',
                    title: '收藏',
                    showBottomLine: true,
                  ),
                  DiscoverCell(
                    imageName: 'images/微信相册.png',
                    title: '相册',
                    showBottomLine: true,
                  ),
                  DiscoverCell(
                    imageName: 'images/微信卡包.png',
                    title: '卡包',
                    showBottomLine: true,
                  ),
                  DiscoverCell(
                    imageName: 'images/微信表情.png',
                    title: '表情',
                    showBottomLine: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DiscoverCell(
                    imageName: 'images/微信设置.png',
                    title: '设置',
                    showBottomLine: false,
                  ),
                ],
              ),
            ),
          ), //列表
          Container(
            child: Positioned(
              right: 20,
              top: 40,
              child: Image.asset('images/相机.png',height: 20,width: 20,),
            ),
          ), //相机
        ],
      ),
    ));
  }
}

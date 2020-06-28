import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterlayout/Const.dart';

class ChatPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ChatPage>  with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  Future<List<Message>> getDatas() async {
    List<Message> messageList = [];
    final Dio dio = Dio();
    final response = await dio
        .get('http://rap2.taobao.org:38080/app/mock/257590/getChatData');
    if (response.statusCode == 200) {
      final responseBody = response.data;
//      List<Message> messageList = responseBody['chatList'].map((item) {
//        return Message.fromMap(item);
//      }).toList();

      List _list = responseBody['chatList'];
      for (int i = 0; i < _list.length; i++) {
        Message message = Message.fromMap(_list[i]);
        messageList.add(message);
      }

      print('网络请求回来数据$responseBody');
      return messageList;
    } else {
      throw Exception('statusCode:${response.statusCode}');
    }
  }

  List<Message> _dataList = [];

  @override
  void initState() {
    getDatas().then((value) {
      setState(() {
        _dataList = value;
      });
    });

    super.initState();
  }

  _cellForRow(BuildContext context, int index) {
    return Container(
      child: Text(_dataList[index].name),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildPopupMenuItem(String imageAss, String title) {
      return Row(
        children: <Widget>[
          Image(
            image: AssetImage(imageAss),
            width: 20,
          ),
          Container(
            width: 20,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: WechatThemeColor,
        title: Text(
          '微信',
          style: TextStyle(fontSize: 18),
        ),
        elevation: 0,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 15),
            child: PopupMenuButton(
              onSelected: (String string) {
                print(string);
              },
              offset: Offset(0, 60),
              child: Image(
                image: AssetImage('images/圆加.png'),
                width: 25,
              ),
              itemBuilder: (BuildContext context) {
                return <PopupMenuItem<String>>[
                  PopupMenuItem(
                    child: _buildPopupMenuItem('images/发起群聊.png', '发起群聊'),
                    value: "发起群聊'",
                  ),
                  PopupMenuItem(
                    child: _buildPopupMenuItem('images/添加朋友.png', '添加朋友'),
                    value: "添加朋友",
                  ),
                  PopupMenuItem(
                    child: _buildPopupMenuItem('images/扫一扫1.png', '扫一扫'),
                    value: "扫一扫",
                  ),
                  PopupMenuItem(
                    child: _buildPopupMenuItem('images/收付款.png', '收付款'),
                    value: "收付款",
                  ),
                ];
              },
            ),
          ),
        ],
      ),
      body: Container(
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(_dataList[index].name),
                subtitle: Container(
                  child: Text(_dataList[index].message,overflow: TextOverflow.ellipsis,),
                ),
                leading: Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    image: DecorationImage(
                      image: NetworkImage(_dataList[index].imageUrl),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
            itemCount: _dataList != null ? _dataList.length : 0),
      ),
    );
  }
}

class Message {
  final String name;
  final String imageUrl;
  final String message;

  Message({this.name, this.imageUrl, this.message});

  factory Message.fromMap(Map map) {
    return Message(
      name: map['name'],
      imageUrl: map['imageUrl'],
      message: map['message'],
    );
  }
}

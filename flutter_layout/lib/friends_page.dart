import 'package:flutter/material.dart';
import 'package:flutterlayout/Const.dart';
import 'package:flutterlayout/friends_data.dart';
import 'package:flutterlayout/index_bar.dart';

class FriendsPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<FriendsPage> {
  final List<Friends> _headDatas = [
    Friends(imageUrl: 'images/新的朋友.png', name: '新的朋友'),
    Friends(imageUrl: 'images/群聊.png', name: '群聊'),
    Friends(imageUrl: 'images/标签.png', name: '标签'),
    Friends(imageUrl: 'images/公众号.png', name: '公众号'),
  ];

  final List<Friends> _listDatas = [];

  Widget _cellForRow(BuildContext context, int index) {
    if (index < _headDatas.length) {
      return _FriendCell(
        imageAssets: _headDatas[index].imageUrl,
        name: _headDatas[index].name,
      );
    }

    bool _hiddenIndexLetter = (index - _headDatas.length > 0 &&
        _listDatas[index - 4].indexLetter == _listDatas[index - 5].indexLetter);

    return _FriendCell(
      imageUrl: _listDatas[index - 4].imageUrl,
      name: _listDatas[index - 4].name,
      groupTitle: _hiddenIndexLetter ? null : _listDatas[index - 4].indexLetter,
    );
  }

  final Map _groupOffsetMap = {
    INDEX_WORDS[0]: 0.0,
    INDEX_WORDS[1]: 0.0,
  };

  ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _listDatas.addAll(datas);
    _listDatas.sort((Friends friend1, Friends friend2) {
      return friend1.indexLetter.compareTo(friend2.indexLetter);
    });

    var _groupOffSet = 54.5 * 4;
    for (int i = 0; i < _listDatas.length; i++) {
      if (i < 1) {
        _groupOffsetMap.addAll({_listDatas[i].indexLetter: _groupOffSet});
        _groupOffSet += 84.5;
      } else if (_listDatas[i].indexLetter == _listDatas[i - 1].indexLetter) {
        _groupOffSet += 54.5;
      } else {
        _groupOffsetMap.addAll({_listDatas[i].indexLetter: _groupOffSet});
        _groupOffSet += 84.5;
      }
    }
    print('所有位置 $_groupOffsetMap');
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                'images/添加朋友.png',
                width: 30,
              ),
            ),
          ),
        ],
        backgroundColor: WechatThemeColor,
        title: Text(
          '通讯录',
          style: TextStyle(fontSize: 18),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: WechatThemeColor,
            child: Container(
              color: WechatThemeColor,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _headDatas.length + _listDatas.length,
                itemBuilder: (BuildContext context, int index) {
                  return _cellForRow(context, index);
                },
              ),
            ),
          ),
          Indexbar(
            indexBarCallback: (String str) {
              print('callback $str');
              if (_groupOffsetMap[str] != null) {
                _scrollController.animateTo(
                  _groupOffsetMap[str],
                  duration: Duration(milliseconds: 2),
                  curve: Curves.easeIn,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class _FriendCell extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String groupTitle;
  final String imageAssets;

  const _FriendCell({
    this.imageUrl,
    this.name,
    this.groupTitle,
    this.imageAssets,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          height: groupTitle != null ? 30 : 0,
          child: groupTitle != null
              ? Text(
                  groupTitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                )
              : null,
        ),
        Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: imageUrl != null
                        ? NetworkImage(imageUrl)
                        : AssetImage(imageAssets),
                  ),
                ),
              ),
              Container(
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 0.5,
          color: WechatThemeColor,
          child: Row(
            children: <Widget>[
              Container(
                width: 54,
                color: Colors.white,
              )
            ],
          ),
        ),
      ],
    );
  }
}

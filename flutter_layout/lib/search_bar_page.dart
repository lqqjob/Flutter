import 'package:flutter/material.dart';
import 'package:flutterlayout/Const.dart';
import 'package:flutterlayout/chat_page.dart';

class SearchBarPage extends StatefulWidget {
  final List<Message> messagesData;

  const SearchBarPage({this.messagesData});

  @override
  _SearchBarPageState createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  List<Message> _showDatas = [];
  String _searchString = '';

  _searchTitle(String title) {
    _showDatas.clear();
    if (title.length > 0) {
      _searchString = title;
      for (int i = 0; i < widget.messagesData.length; i++) {
        Message tempMessage = widget.messagesData[i];
        if (tempMessage.name.contains(title) ||
            tempMessage.message.contains(title)) {
          _showDatas.add(tempMessage);
        }
      }
    }

    setState(() {});
  }

  TextStyle _normalStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );
  TextStyle _highlightedStyle = TextStyle(
    fontSize: 16,
    color: Colors.green,
  );

  Widget _showNameString(String name) {
    List<TextSpan> spans = [];
    //剪切出来
    List<String> strs = name.split(_searchString);
    for (int i = 0; i < strs.length; i++) {
      String str = strs[i];
      if (str == '' && i < strs.length - 1) {
        spans.add(TextSpan(text: _searchString, style: _highlightedStyle));
      } else {
        spans.add(TextSpan(text: str, style: _normalStyle));
        if (i < strs.length - 1) {
          spans.add(TextSpan(text: _searchString, style: _highlightedStyle));
        }
      }
    }
    return RichText(
      text: TextSpan(children: spans),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: WechatThemeColor,
        child: Column(
          children: <Widget>[
            SearchBar(
              textChanged: (String string) {
                _searchTitle(string);
              },
            ),
            Expanded(
              flex: 1,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: NotificationListener(
                    onNotification: (note) {
//                      FocusScope.of(context).requestFocus(FocusNode());
                      return true;
                    },
                    child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            color: Colors.white,
                            child: ListTile(
                              title: _showNameString(_showDatas[index].name),
                              subtitle: Container(
                                child:
                                    _showNameString(_showDatas[index].message),
                              ),
                              leading: Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.0),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        _showDatas[index].imageUrl),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Container(
                            color: Colors.white,
                            child: Divider(
                              indent: 75,
                            ),
                          );
                        },
                        itemCount: _showDatas != null ? _showDatas.length : 0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  final ValueChanged<String> textChanged;

  SearchBar({this.textChanged});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _controller = TextEditingController();
  bool _showClear = false;

  @override
  void initState() {
    super.initState();
  }

  _textChaged(String string) {
    widget.textChanged(string);
    if (string.length > 0) {
      _showClear = true;
    } else {
      setState(() {
        _showClear = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      color: WechatThemeColor,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Container(
            height: 40,
            color: WechatThemeColor,
            child: Row(
              children: <Widget>[
                Container(
                  width: ScreenWidth(context) - 50,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  margin: EdgeInsets.only(
                    left: 5,
                    right: 5,
                  ),
                  padding: EdgeInsets.only(
                    left: 5,
                    right: 5,
                  ),
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'images/放大镜w.png',
                        width: 23,
                        color: Colors.grey[400],
                      ),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: _controller,
                          onChanged: _textChaged,
                          autofocus: true,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          cursorColor: Colors.green,
                          decoration: InputDecoration(
                            hintText: '搜索',
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 5, bottom: 10),
                          ),
                        ),
                      ),
                      _showClear
                          ? GestureDetector(
                              onTap: () {
                                _controller.clear();
                                _textChaged('');
                              },
                              child: Icon(
                                Icons.cancel,
                                size: 20,
                                color: Colors.grey,
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    '取消',
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

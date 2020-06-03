import 'package:flutter/material.dart';
import 'package:flutterlayout/discover_page.dart';
import 'package:flutterlayout/friends_page.dart';
import 'chat_page.dart';
import 'mine_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 2;

  List<Widget> _pages = [ChatPage(), FriendsPage(), DisCoverPage(), MinePage()];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          fixedColor: Colors.green,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12.0,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "images/tabbar_chat.png",
                height: 20,
                width: 20,
              ),
              title: Text('微信'),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "images/tabbar_friends.png",
                height: 20,
                width: 20,
              ),
              title: Text('通讯录'),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "images/tabbar_discover.png",
                height: 20,
                width: 20,
              ),
              title: Text('发现'),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "images/tabbar_mine.png",
                height: 20,
                width: 20,
              ),
              title: Text('我'),
            ),
          ],
        ),
      ),
    );
  }
}
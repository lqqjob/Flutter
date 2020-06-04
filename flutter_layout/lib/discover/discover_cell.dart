import 'package:flutter/material.dart';
import 'package:flutterlayout/Const.dart';

class DiscoverCell extends StatefulWidget {
  final String imageName;
  final String title;
  final String subTitle;
  final bool showBottomLine;

   DiscoverCell({this.imageName, this.title, this.subTitle,this.showBottomLine});

  @override
  _DiscoverCellState createState() => _DiscoverCellState();
}

class _DiscoverCellState extends State<DiscoverCell> {
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        setState(() {
          _backgroundColor = Colors.grey[300];
        });
      },
      onTap: () {
        setState(() {
          _backgroundColor = Colors.white;
        });
      },
      onPanCancel: () {
        setState(() {
          _backgroundColor = Colors.white;
        });
      },
      child:Column(
        children: <Widget>[
          Container(
            height: 55,
            color: _backgroundColor,
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: (ScreenWidth(context) - 30) / 2,
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          widget.imageName,
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(width: 15),
                        Text(
                          widget.title,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: (ScreenWidth(context) - 30) / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          widget.subTitle != null ? widget.subTitle : '',
                          style: TextStyle(fontSize: 12),
                        ),
                        Image.asset(
                          'images/icon_right.png',
                          height: 15,
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: widget.showBottomLine?0.5:0,
            child: Row(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  width: 50,
                ),
                Container(
                  color: Colors.grey[300],
                  width: ScreenWidth(context) - 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

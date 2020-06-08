import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutterlayout/Const.dart';

class Indexbar extends StatefulWidget {

  final void Function(String str) indexBarCallback;

  Indexbar({this.indexBarCallback});

  @override
  _IndexbarState createState() => _IndexbarState();
}

int getIndex(BuildContext context, Offset globalPosition) {
  RenderBox box = context.findRenderObject();
  double y = box.globalToLocal(globalPosition).dy;
  var itemHeight = ScreenHeight(context) * 2 / 3 / INDEX_WORDS.length;
  int index = (y ~/ itemHeight).clamp(0, INDEX_WORDS.length - 1);

  return index;
}

class _IndexbarState extends State<Indexbar> {
  double _indicatorY = 0.0;
  String _indicatorText = 'A';
  bool _indicatorHidden = true;

  @override
  Widget build(BuildContext context) {
    List<Widget> words = [];

    for (int i = 0; i < INDEX_WORDS.length; i++) {
      words.add(
        Expanded(
          child: Text(
            INDEX_WORDS[i],
            style: TextStyle(fontSize: 10),
          ),
        ),
      );
    }
    return Positioned(
      right: 10,
      width: 130,
      top: ScreenHeight(context) / 10,
      height: ScreenHeight(context) * 2 / 3,
      child: Row(
        children: <Widget>[
          Container(
            width: 100,
            alignment: Alignment(0, _indicatorY),
            child: _indicatorHidden
                ? null
                : Stack(
              alignment: Alignment(-0.2,0),
                    children: <Widget>[
                      Image(
                        image: AssetImage('images/气泡.png'),
                        width: 60,
                      ),
                      Text(
                        _indicatorText,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),
          ),
          GestureDetector(
            onVerticalDragUpdate: (DragUpdateDetails details) {
              int index = getIndex(context, details.globalPosition);
              if(widget.indexBarCallback != null) {
                widget.indexBarCallback(INDEX_WORDS[index]);
              }
              setState(() {
                _indicatorText = INDEX_WORDS[index];
                _indicatorHidden = false;
                _indicatorY = 2.2 / 27 * index - 1.1;
              });
            },
            onVerticalDragDown: (DragDownDetails details) {
              int index = getIndex(context, details.globalPosition);
              if(widget.indexBarCallback != null) {
                widget.indexBarCallback(INDEX_WORDS[index]);
              }
              setState(() {
                _indicatorText = INDEX_WORDS[index];
                _indicatorHidden = false;
                _indicatorY = 2.2 / 27 * index - 1.1;
              });
            },
            onVerticalDragEnd: (DragEndDetails details) {
              setState(() {
                _indicatorHidden = true;

              });
            },
            child: Container(
//              color: Colors.red,
              width: 30,
              child: Column(
                children: words,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const INDEX_WORDS = [
  '🔍',
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];

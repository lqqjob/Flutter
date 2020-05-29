import 'package:flutter/material.dart';

/*
 * 关于主轴:
 * spaceBetween 剩下的空间平均分布到小部件之间
 * spaceAround  剩下的空间平均分布到小部件的周围
 * spaceEvenly  剩下的空间和小部件一起平均分布
 * */

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      alignment: Alignment(0.0, 0.0), //x,y
      child: AspectDemo(),
    );
  }
}

class AspectDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 150,
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Icon(Icons.add, size: 30),
      ),
    );
  }
}

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0.0, 0.0),
      children: <Widget>[
        Positioned(
          child: Container(
            color: Colors.white,
            width: 400,
            height: 200,
            child: Icon(Icons.add),
          ),
        ),
        Positioned(
            child: Container(
          color: Colors.red,
          width: 250,
          height: 250,
          child: Icon(Icons.search),
        )),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            color: Colors.blue,
            width: 50,
            height: 50,
            child: Icon(Icons.search),
          ),
        ),
      ],
    );
  }
}

class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.ideographic,
      //alphabetic  英文字符
      //ideographic 中文字符
      children: <Widget>[
        Expanded(
          child: Container(
            height: 80,
            color: Colors.white,
            child: Text(
              'hello',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 80,
            color: Colors.blue,
            child: Text(
              '嘿嘿12312312',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 80,
            color: Colors.red,
            child: Text(
              'heihei',
              style: TextStyle(fontSize: 60),
            ),
          ),
        ),
      ],
    );
  }
}

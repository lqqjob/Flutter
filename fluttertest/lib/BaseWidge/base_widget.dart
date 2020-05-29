import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    fontSize: 16.0,
  );

  final String _title = 'Flutter高级进阶班';
  final String _autor = 'Hank';

  @override
  Widget build(BuildContext context) {
    return Text(
      '<$_title> -- $_autor.本套课程将针对iOS开发者快速上手Flutter技术.本课程设计贯穿整个实战项目,通过项目需求快速学习各项技术.同时在项目实战过程中会通过带着大家探索相应的原理性知识，完成从 Flutter 入门到进阶的转变',
      textAlign: TextAlign.center,
      style: _textStyle,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '<Flutter高级进阶班>',
        style: TextStyle(
          fontSize: 30,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
              text: '--',
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
              )),
          TextSpan(
              text: 'Hank', style: TextStyle(fontSize: 16, color: Colors.blue)),
        ],
      ),
    );
  }
}


class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Icon(
              Icons.add,
              size: 45,
            ),
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.all(20),
            height: 200,
            width: 200,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      alignment: Alignment(0.0, 0.0),
      child: RowDemo(),
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
          aspectRatio: 2/1,
        child: Icon(Icons.add,size: 30,),
      ),
    );
  }
}

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0, 0),
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
         ),
        ),
        Positioned(
//          left: 10,
//          top: 80,
            child: Container(
              color: Colors.blue,
              width: 50,
              height: 50,
              child: Icon(Icons.accessibility),

            )
        ),
      ],
    );
  }
}

class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.ideographic,
      children: <Widget>[
       Expanded(child:
       Container(
         height: 80,
         color: Colors.white,
         child: Text('Hello',
           style: TextStyle(fontSize: 15),
         ),
       ),
       ),
        Expanded(child:  Container(
          height: 80,
          color: Colors.red,
          child: Text('NIhao',
            style:TextStyle(fontSize: 30) ,
          ),
        ),),
       Expanded(child:
       Container(
         height: 80,
         color: Colors.cyan,
         child: Text("a",
           style: TextStyle(fontSize: 60),
         ),
       ),
       ),

      ],
    );
  }
}




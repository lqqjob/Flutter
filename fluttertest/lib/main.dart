import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/8%20%E4%BA%8B%E4%BB%B6%E5%A4%84%E7%90%86%E4%B8%8E%E9%80%9A%E7%9F%A5/NotificationRoute.dart';
import '7 导航返回拦截/WillPopScope.dart';
import '7 导航返回拦截/InheritedWidget.dart';
import '7 导航返回拦截/ProviderWidget.dart';
import '7 导航返回拦截/ThemeRoute.dart';
import 'package:fluttertest/7 导航返回拦截/ThemeRoute.dart';
import 'package:fluttertest/7 导航返回拦截/FutureBuilder.dart';
import 'package:fluttertest/7 导航返回拦截/StreamBuilder.dart';
import 'package:fluttertest/7 导航返回拦截/AlertDialog.dart';
import '8 事件处理与通知/PointerEventRoute.dart';
import '8 事件处理与通知/GestureRoute.dart';
import '9 动画/ScaleAnimationRoute.dart';
import '9 动画/FateRoute.dart';
import '9 动画/HeroAnimationRoute.dart';
import '9 动画/StaggerRoute.dart';
import '9 动画/AnimatedSwitcherCounterRoute.dart';
import '9 动画/OverAnimationComponent.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final count = 50;
    List list = new List<Map>();
    for (int i = 0; i < count; i++) {
      Map map = new Map();
      if (i == 0) {
        map["title"] = "导航返回拦截";
        map["page"] = WillPopScopeTestRoute();
      } else if (i == 1) {
        map["title"] = "数据共享";
        map["page"] = InheritedWidgetTestRoute();
      } else if (i == 2) {
        map["title"] = "跨组件状态共享";
        map["page"] = ProviderRoute();
      } else if (i == 3) {
        map["title"] = "颜色跟主题";
        map["page"] = ThemeTestRoute();
      } else if (i == 4) {
        map["title"] = "异步UI更新（FutureBuider）";
        map["page"] = FutureBuilderRoute();
      } else if (i == 5) {
        map["title"] = "异步UI更新（StreamBuilder）";
        map["page"] = StreamBuilderRoute();
      } else if (i == 6) {
        map["title"] = "对话框详解";
        map["page"] = AlertDialogRoute();
      }else if (i == 7) {
        map["title"] = "原始指针事件处理";
        map["page"] = PointerEventRoute();
      }else if (i == 8) {
        map["title"] = "手势识别";
        map["page"] = GestureRoute();
      }else if (i == 9) {
        map["title"] = "通知（Notification）";
        map["page"] = NotificationRoute();
      }else if (i == 10) {
        map["title"] = "动画结构";
        map["page"] = ScaleAnimationRoute();
      }else if (i == 11) {
        map["title"] = "自定义动画路径";
        map["page"] = ScaleAnimationRoute();
      }else if (i == 12) {
        map["title"] = "Hero 动画";
        map["page"] = HeroAnimationRoute();
      }else if (i == 13) {
        map["title"] = "交织动画";
        map["page"] = StaggerRoute();
      }else if (i == 14) {
        map["title"] = "通用“切换动画”组件";
        map["page"] = AnimationtedSwitcherCounterRoute();
      }else if (i == 15) {
        map["title"] = "动画过渡组件";
        map["page"] = OverAnimationComponent();
      }
      if(map["title"] != null)
      list.add(map);
    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ConstrainedBox(
          constraints: BoxConstraints(minWidth: double.infinity),
          child: ListView.separated(
            itemCount: list.length,
            separatorBuilder: (BuildContext contex,int index) {
              return Divider(color: Colors.black12);
            },
            itemBuilder: (BuildContext context, int index) {
              Map map = list[index];
              String string = map["title"];
              Widget route = map["page"];
              return ListTile(
                title: Text(string),
                onTap: () {
                  if(index != 11){
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (BuildContext context) => route));
                  }else {//自定义动画路径
                    Navigator.push(context, FadeRoute(builder: (context){
                      return route;
                    }));
                  }
                },
              );
            },
          )),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/StopNaviBack/AlertDialog.dart';
import 'package:fluttertest/StopNaviBack/StreamBuilder.dart';
import 'EventAndNotification/NotificationRoute.dart';
import 'StopNaviBack/WillPopScope.dart';
import 'StopNaviBack/InheritedWidget.dart';
import 'StopNaviBack/ProviderWidget.dart';
import 'StopNaviBack/ThemeRoute.dart';
import 'EventAndNotification/PointerEventRoute.dart';
import 'EventAndNotification/GestureRoute.dart';
import 'Animation/ScaleAnimationRoute.dart';
import 'Animation/FateRoute.dart';
import 'Animation/HeroAnimationRoute.dart';
import 'Animation/StaggerRoute.dart';
import 'Animation/AnimatedSwitcherCounterRoute.dart';
import 'Animation/OverAnimationComponent.dart';
import 'CustomDart/GradientButtonRoute.dart';
import 'CustomDart/TurnBoxRoute.dart';
import 'CustomDart/CustomPaintRoute.dart';
import 'CustomDart/GradientCircularPorgressRoute.dart';
import 'FileAndNetWork/FileOperationRoute.dart';
import 'FileAndNetWork/HttpTestRoute.dart';
import 'FileAndNetWork/FutrueBuilderRoute.dart';
import 'FileAndNetWork/JsonToDartModel.dart';

void main() => runApp(MyApp());

class RouteModel extends Object {
  String title;
  Widget widget;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
    List list = new List<RouteModel>();
    for (int i = 0; i < count; i++) {
      RouteModel map = RouteModel();
      if (i == 0) {
        map.title = "导航返回拦截";
        map.widget = WillPopScopeTestRoute();
      } else if (i == 1) {
        map.title = "数据共享";
        map.widget = InheritedWidgetTestRoute();
      } else if (i == 2) {
        map.title = "跨组件状态共享";
        map.widget = ProviderRoute();
      } else if (i == 3) {
        map.title = "颜色跟主题";
        map.widget = ThemeTestRoute();
      } else if (i == 4) {
        map.title = "异步UI更新（FutureBuider）";
        map.widget = FutrueBuilderRoute();
      } else if (i == 5) {
        map.title = "异步UI更新（StreamBuilder）";
        map.widget = StreamBuilderRoute();
      } else if (i == 6) {
        map.title = "对话框详解";
        map.widget = AlertDialogRoute();
      } else if (i == 7) {
        map.title = "原始指针事件处理";
        map.widget = PointerEventRoute();
      } else if (i == 8) {
        map.title = "手势识别";
        map.widget = GestureRoute();
      } else if (i == 9) {
        map.title = "通知（Notification）";
        map.widget = NotificationRoute();
      } else if (i == 10) {
        map.title = "动画结构";
        map.widget = ScaleAnimationRoute();
      } else if (i == 11) {
        map.title = "自定义动画路径";
        map.widget = ScaleAnimationRoute();
      } else if (i == 12) {
        map.title = "Hero 动画";
        map.widget = HeroAnimationRoute();
      } else if (i == 13) {
        map.title = "交织动画";
        map.widget = StaggerRoute();
      } else if (i == 14) {
        map.title = "通用“切换动画”组件";
        map.widget = AnimationtedSwitcherCounterRoute();
      } else if (i == 15) {
        map.title = "动画过渡组件";
        map.widget = OverAnimationComponent();
      } else if (i == 16) {
        map.title = "组和现有组件";
        map.widget = GrandientButtonRoute();
      } else if (i == 17) {
        map.title = "组合实例";
        map.widget = TurnBoxRoute();
      } else if (i == 18) {
        map.title = "自绘组件";
        map.widget = CustomPaintRoute();
      } else if (i == 19) {
        map.widget = GradientCircularPorgressRoute();
        map.title = "自绘实例";
      } else if(i == 20) {
        map.widget = FileOperationRoute();
        map.title = "文件操作";
      } else if (i == 21) {
        map.widget = HttpTestRoute();
        map.title = "通过HttpClient发起HTTP请求";
      }else if(i == 22) {
        map.widget = FutrueBuilderRoute();
        map.title = "Http请求-Dio http库";
      } else if(i == 23) {
        map.widget = JsonToDartModel();
        map.title = "Json转Dart Model类";
      }
      if (map.title != null) list.add(map);
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
            separatorBuilder: (BuildContext contex, int index) {
              return Divider(color: Colors.black12);
            },
            itemBuilder: (BuildContext context, int index) {
              RouteModel map = list[index];
              String string = map.title;
              Widget route = map.widget;
              return ListTile(
                title: Text(string),
                onTap: () {
                  if (index != 11) {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) => route));
                  } else {
                    //自定义动画路径
                    Navigator.push(context, FadeRoute(builder: (context) {
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

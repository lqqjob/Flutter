import 'package:flutter/material.dart';
import 'GestureDetectorRoute.dart';
import 'Drag.dart';
import 'DragVertical.dart';
import 'ScaleRoute.dart';
import 'GestureRecognizerRoute.dart';
import 'GestureConflictRoute.dart';
import 'BothDirectionRoute.dart';

class GestureRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GestureRouteState();
  }
}

class _GestureRouteState extends State<GestureRoute> {
  @override
  Widget build(BuildContext context) {
    final count = 7;
    List list = new List<Map>();
    for (int i = 0; i < count; i++) {
      Map map = new Map();
      if (i == 0) {
        map["title"] = "手势检测（点击、双击、长按）";
        map["page"] = GestureDetectorRoute();
      } else if (i == 1) {
        map["title"] = "拖动、滑动(任意方向)";
        map["page"] = Drag();
      } else if (i == 2) {
        map["title"] = "拖动、滑动(单一方向)";
        map["page"] = DragValticalRoute();
      } else if (i == 3) {
        map["title"] = "缩放";
        map["page"] = ScaleRoute();
      } else if (i == 4) {
        map["title"] = "手势";
        map["page"] = GestureRecognizerRoute();
      } else if (i == 5) {
        map["title"] = "手势竞争";
        map["page"] = BothDirectionRoute();
      } else if (i == 6) {
        map["title"] = "手势冲突";
        map["page"] = GestureConflictRoute();
      }
      list.add(map);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("手势识别"),
      ),
      body: ListView.separated(
        itemCount: list.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.black12,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          Map map = list[index];
          String title = map["title"];
          Widget route = map["page"];
          return ListTile(
            title: Text(title),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => route));
            },
          );
        },
      ),
    );
  }
}

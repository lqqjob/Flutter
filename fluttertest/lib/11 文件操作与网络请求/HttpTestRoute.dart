import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

class HttpTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HttpTestRouteState();
  }
}

class _HttpTestRouteState extends State<HttpTestRoute> {
  bool _loading = false;
  String _text = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("通过HttpClient发起HTTP请求"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("获取百度首页"),
              onPressed: _loading
                  ? null
                  : () async {
                      setState(() {
                        _loading = true;
                        _text = "正在请求。。。";
                      });
                      try {
                        HttpClient httpClient = new HttpClient();
                        HttpClientRequest request = await httpClient.getUrl(
                          Uri.parse("https://www.baidu.com"));
                          request.headers.add("user-agent", "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
                        HttpClientResponse response = await request.close(); 
                        _text = await response.transform(utf8.decoder).join();
                        print(response.headers);
                      } catch (e) {
                        _text = "请求失败：$e";
                        print("$e");
                      } finally {
                        setState(() {
                        _loading = false;
                        });
                      }
                    },
            ),
            Container(
              width: MediaQuery.of(context).size.width-50,
              child: SingleChildScrollView(
                child: Text(_text.replaceAll(new RegExp(r"\s"),"")),
              ),
            )
          ],
        ),
      ),
    );
  }
}

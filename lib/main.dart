import 'package:flutter/material.dart';

void main() => runApp(new FlutterApp());


class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '任务页面标题',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('tabbar'),
        ),
        body: new Center(
          child: new Text('内容'),
        ),
      ),
    );
  }
}

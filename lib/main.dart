import 'package:flutter/material.dart';

import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

void main() => runApp(new FlutterApp());


class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '任务页面标题',
      home: new DemoFlutter(),
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('tabbar'),
//        ),
//        body: new Center(
//          child: new Text('内容'),
//        ),
//      ),
    );
  }
}

class DemoFlutter extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // ignore: expected_token
    return new DemoFlutterState();
  }
//   ignore: missing_method_parameters
//  createState => new DemoFlutterState();

}

class DemoFlutterState extends State<DemoFlutter> {
  var _list = [];
  //添加一个属性来保存文本的样式
  final _biggerFont = const TextStyle(fontSize: 18.0);
  _loadData() async {
    String dataURL = "https://api.github.com/orgs/raywenderlich/members";
//    http.Response response = await http.get(dataURL);
    Dio dio = new Dio();
    Response response = await dio.get(dataURL);
    setState(() {
      _list = JSON.decode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold (
        appBar: new AppBar(
        title: new Text("新的组件"),
      ),
      body: new Text("新的组件"),
    );
  }
}

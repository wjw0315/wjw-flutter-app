import 'package:flutter/material.dart';

import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

void main() => runApp(new FlutterApp());


class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FlutterAPP',
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
    String dataURL = "https://api.github.com/users";
//    http.Response response = await http.get(dataURL);
    Dio dio = new Dio();
    Response response = await dio.get(dataURL);
    setState(() {
      _list = response.data;
    });
  }

  /**
   * 重写initSate方法，在组件初始化时调用_loadData方法
   */
  @override
  void initState(){
    super.initState();
    _loadData();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold (
        appBar: new AppBar(
        title: new Text("FlutterAPP"),
      ),
//      body: new Text("新的组件"),
        body: new ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: _list.length,
            itemBuilder: (BuildContext context, int position) {
              return _buiddList(position);
            }),
    );
  }

  /**
   * 使用ListView组件显示_loadData方法中获取到的list数据
   */
  Widget _buiddList(int i){
    //返回一个ListTile组件，该组件显示第iJSON成员的"login"值，
    // 还使用您之前创建的文本样式(_biggerFont)
      return new ListTile(
          title : new Text("${_list[i]["login"]}", style: _biggerFont)
      );
  }
}

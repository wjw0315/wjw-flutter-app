import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:dio/dio.dart';

import 'entity/Member.dart';

void main() => runApp(new FlutterApp());


class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FlutterAPP',
      //主题添加
      theme: new ThemeData(primaryColor: Colors.green.shade800),
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
//  var _list = [];
//  var _list1 = <Member>[];
  List<Member> _list2 = [];
  //添加一个属性来保存文本的样式
  final _biggerFont = const TextStyle(fontSize: 18.0);
  _loadData() async {
    String dataURL = "https://api.github.com/users";
//    http.Response response = await http.get(dataURL);
    Dio dio = new Dio();
    Response response = await dio.get(dataURL);
    setState(() {
//      _list = response.data;
      for(var data in response.data){
//          Member member = new Member.login(data["login"]);
            Member member = new Member(data["login"], data["avatar_url"]);
          _list2.add(member);
      }
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
//            padding: const EdgeInsets.all(16.0),
            itemCount: _list2.length * 2,
            itemBuilder: (BuildContext context, int position) {
              if(position.isOdd)
                return new Divider();
              int index = position ~/ 2;
              return _buiddList(index);
            }),
    );
  }

  /**
   * 使用ListView组件显示_loadData方法中获取到的list数据
   */
  Widget _buiddList(int i){
    //返回一个ListTile组件，该组件显示第iJSON成员的"login"值，
    // 还使用您之前创建的文本样式(_biggerFont)
      return new Padding(
        padding: const EdgeInsets.all(16.0),
        child:  new ListTile(
//            title : new Text("${_list[i]["login"]}", style: _biggerFont)
            title : new Text("${_list2[i].login}", style: _biggerFont),
            leading: new CircleAvatar(
                backgroundColor: Colors.blue,
                //avatarUrl不能为空
                backgroundImage: new NetworkImage(_list2[i].avatarUrl)
            ),
        )
      );

  }
}

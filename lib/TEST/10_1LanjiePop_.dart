import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled =false;
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: XHQSTFW(),

//      new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter'),
//        ),
//        body: new Center(
//          child: new Text('Hello World'),
//        ),
//      ),
    );
  }
}

class XHQSTFW extends StatefulWidget {
  @override
  _XHQSTFWState createState() => _XHQSTFWState();
}

class _XHQSTFWState extends State<XHQSTFW> {
  @override
  Widget build(BuildContext context) {
    return
      new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          child: IconButton(icon: Icon(Icons.build), onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(fullscreenDialog: true,builder:(BuildContext context){
              return  NewRoute();
            }));

          }),
        ),
      );
  }
}



class WillPopScopeTestRoute extends StatefulWidget {
  @override
  WillPopScopeTestRouteState createState() {
    return new WillPopScopeTestRouteState();
  }
}


class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return WillPopScope(//Future<bool> Function();
      onWillPop:  ()async{
        if(_lastPressedAt ==null || DateTime.now().difference(_lastPressedAt).inSeconds>1){
          
          
          _lastPressedAt =DateTime.now();
          return false;

        }
        return true;
    },
      child: Container(
        alignment: Alignment.center,
        child: Text("1秒内连续按两次返回键退出"),
      ),
    );
  }

//class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
//  DateTime _lastPressedAt; //上次点击时间
//
//  @override
//  Widget build(BuildContext context) {
//    return new WillPopScope(//相当于在widget外嵌套一层WillPopScope?
//        onWillPop: () async {
//          if (_lastPressedAt == null ||
//              DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
//            //两次点击间隔超过1秒则重新计时
//            _lastPressedAt = DateTime.now();
//            return false;
//          }
//          return true;
//        },
//        child: Container(
//          alignment: Alignment.center,
//          child: Text("1秒内连续按两次返回键退出"),
//        )
//    );
//  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: new WillPopScopeTestRoute(),
      ),
    );
  }
}
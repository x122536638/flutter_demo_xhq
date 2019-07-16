import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';

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
          child:
          NotificationRoute(),
          //new Text('Hello World'),
//          NotificationListener(
//            onNotification: (notification){
//              //print(notification);
//              switch (notification.runtimeType){
//                case ScrollStartNotification: print("开始滚动"); break;
//                case ScrollUpdateNotification: print("正在滚动"); break;
//                case ScrollEndNotification: print("滚动停止"); break;
//                case OverscrollNotification: print("滚动到边界"); break;
//              }
//            },
//            child: ListView.builder(
//
//                itemCount: 100,
//                itemBuilder: (context, index) {
//                  return ListTile(title: Text("$index"),);
//                }
//            ),
//          ),
        ),
      );
  }
}
class NotificationRoute extends StatefulWidget {
  @override
  NotificationRouteState createState() {




    5.abs();
    return new NotificationRouteState();
  }
}

class NotificationRouteState extends State<NotificationRoute> {
  String _msg="";
  @override
  Widget build(BuildContext context) {
    //监听通知
    return NotificationListener<MyNotification>(
      onNotification: (notification) {
        setState(() {
          _msg+=notification.msg+"  ";
        });
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
//          RaisedButton(
//           onPressed: () => MyNotification("Hi").dispatch(context),
//           child: Text("Send Notification"),
//          ),
            Builder(
              builder: (context) {//这个是不是 相当于新建了一层context ,因为notif是向上传递的
                return RaisedButton(
                  //按钮点击时分发通知
                  onPressed: () => MyNotification("Hi").dispatch(context),
                  child: Text("Send Notification"),
                );
              },
            ),
            Text(_msg)
          ],
        ),
      ),
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}
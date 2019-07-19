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
          child:
          //new Text('Hello World'),
          NotificationListener(
            onNotification: (notification){
              //print(notification);
              switch (notification.runtimeType){
                case ScrollStartNotification: print("开始滚动"); break;
                case ScrollUpdateNotification: print("正在滚动"); break;
                case ScrollEndNotification: print("滚动停止"); break;
                case OverscrollNotification: print("滚动到边界"); break;
              }
            },
            child: ListView.builder(

                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(title: Text("$index"),);
                }
            ),
          ),
        ),
      );
  }
}

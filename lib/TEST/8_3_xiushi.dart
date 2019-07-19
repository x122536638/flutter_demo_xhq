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
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body:


//        Column(
//          //测试Row对齐方式，排除Column默认居中对齐的干扰
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Container(
//              color: Colors.red,
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Text(" hello world "),
//                  Text(" I am Jack "),
//                ],
//              ),
//            ),
//            Container(
//              color: Colors.red,
//
//              child: Row(
////                mainAxisSize: MainAxisSize.min,
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Text(" hello world "),
//                  Text(" I am Jack "),
//                ],
//              ),
//            ),
//            Container(
//              color: Colors.red,
//
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.end,
//                textDirection: TextDirection.rtl,
//                children: <Widget>[
//                  Text(" hello world "),
//                  Text(" I am Jack "),
//                ],
//              ),
//            ),
//            Row(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              verticalDirection: VerticalDirection.up,
//              children: <Widget>[
//                Text(" hello world ", style: TextStyle(fontSize: 30.0),),
//                Text(" I am Jack "),
//              ],
//            ),
//          ],
//        )










        DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
                borderRadius: BorderRadius.circular(3.0), //3像素圆角
                boxShadow: [ //阴影
                  BoxShadow(
                      color:Colors.black54,
                      offset: Offset(2.0,2.0),
                      blurRadius: 4.0
                  )
                ]
            ),
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 180.0, vertical: 18.0),
              child: Text("Login", style: TextStyle(color: Colors.white),),
            )
        )










        ,
      ),
    );
  }
}
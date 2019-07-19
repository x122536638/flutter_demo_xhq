import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = false;
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

//矩阵变化

//        Center(
//          child: Container(
//            color: Colors.black,
//            child: new Transform(
//              alignment: Alignment.topLeft, //相对于坐标系原点的对齐方式
//              transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
//              child: new Container(
//                padding: const EdgeInsets.all(98.0),
//                color: Colors.deepOrange,
//                child: const Text('Apartment for rent!'),
//              ),
//            ),
//          ),
//        )

//        Center(
//          child: DecoratedBox(
//            decoration:BoxDecoration(color: Colors.red),
//            //默认原点为左上角，左移20像素，向上平移5像素
//            child: Transform.translate(
//              offset: Offset(-120.0, -5.0),
//              child: Text("Hello world"),
//            ),
//          ),
//        )

//

//            Container(
////        color: Colors.red,
////        transform: ,
//          decoration: BoxDecoration(
//            gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
//            boxShadow: [
//              //卡片阴影
//              BoxShadow(
//                  color: Colors.black54,
//                  offset: Offset(2.0, 2.0),
//                  blurRadius: 4.0)
//            ],
//          ),
//          padding: EdgeInsets.all(100),
////          box,
//
//          child: Text("hello jack"),
//        )
//
//
//
//
//        ,

              Column(
            children: <Widget>[
              //用continer 实现
              Container(
                margin: EdgeInsets.all(20),
                child: Text('hello world'),
                color: Colors.orange,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text('hello world'),
                color: Colors.orange,
              ),

              Padding(
                padding: EdgeInsets.all(20),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.orange),
                  child: Text("hello world"),
                ),
              ),


              DecoratedBox(
                decoration: BoxDecoration(color: Colors.orange,),
                child: Padding(padding: EdgeInsets.all(20),child: Text("hello world") ,),

              ),
            ],
          )

      ),
    );
  }
}

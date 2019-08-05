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
            Container(
              child: Column(
                children: <Widget>[
                  DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
                          borderRadius: BorderRadius.circular(3.0), //3像素圆角
                          boxShadow: [ //阴影
                            BoxShadow(
                                color:Colors.black,
                                offset: Offset(.0,2.0),
                                blurRadius: 4.0
                            )
                          ]
                      ),
                      child: Padding(padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                        child: Text("Login", style: TextStyle(color: Colors.white),),
                      )
                  ),
                  Container(margin: EdgeInsets.only(top:4),height: 10,color: Colors.blueAccent,),
                ],
              )
              ,
            )
        ),
      );
  }
}

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
        body:
          MaterialApp(
            home: Scaffold(
              body: Center(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, //每行三列
                          childAspectRatio: 1.0 //显示区域宽高相等
                      ),
                      itemCount:40,
                      itemBuilder: (context, index) {

                        return IconButton(icon: Icon(Icons.ac_unit), onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => NewRoute()));

                        });
                      }
                  )
                  ,
          ),
            )


//        Center(
//          child: GridView.builder(
//              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                  crossAxisCount: 2, //每行三列
//                  childAspectRatio: 1.0 //显示区域宽高相等
//              ),
//              itemCount:40,
//              itemBuilder: (context, index) {
//
//                return Text(index.toString());
//              }
//          )
//          ,
        ),
      );
  }
}
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

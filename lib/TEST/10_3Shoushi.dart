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
  PointerEvent _event;




  @override
  Widget build(BuildContext context) {
    return
      new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          child:

          Listener(
            child: Container(
              alignment: Alignment.center,
              color: Colors.lightBlue,
              width: 300.0,
              height: 150.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(_event?.toString()??"",style: TextStyle(color: Colors.white)),
              ),
            ),
//            onPointerDown: (PointerDownEvent event) => setState(()=>_event=event),
            onPointerMove: (PointerMoveEvent event) => setState(()=>_event=event),
//            onPointerUp: (PointerUpEvent event) => setState(()=>_event=event),
          ),

//          new Text('Hello World'),
        ),
      );
  }
}

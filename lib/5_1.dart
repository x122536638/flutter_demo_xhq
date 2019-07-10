import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          child: new Container(
            color: Colors.black54,
//            child: RichText(
//              text: TextSpan(
//                text: 'Hello ',
//                style: DefaultTextStyle.of(context).style,
//                children: <TextSpan>[
//                  TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
//                  TextSpan(text: ' world!'),
//
//                ],
//              ),
//
//            ),
//          child: Row(
//            children: <Widget>[
//
//              new Expanded(child: new Text("adadad",textAlign: TextAlign.center,)),
//              new Expanded(child: new Text("adadad\nsss",textAlign: TextAlign.center,)),
////              new Expanded(child: FlutterLogo()),
//
//            new Expanded(child: FittedBox(child: FlutterLogo(),fit: BoxFit.fitWidth,))
//            ],
//          ),



          child: Row(
            children: <Widget>[
              const FlutterLogo(),
              new Expanded(child:              const Text('Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
              ),
              const Icon(Icons.sentiment_very_satisfied),
            ],
          ),
          ),
        ),
      ),
    );
  }
}

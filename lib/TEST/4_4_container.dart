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
//          child: new Text('Hello World'),
        child: new Container(
          height: 350,
          width: 550,
          color: Colors.red,
          padding: EdgeInsets.all(200),
          margin: EdgeInsets.all(10.0),
        ),
        ),
      ),
    );
  }
}
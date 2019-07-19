import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled =true;
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(

          child: SingleChildScrollView(
            child: Center(
              child: Column(

                children: str.split("").map(   (e) => Text(e,textScaleFactor: 3,)).toList(),

              ),
            ),

          ),




        ),
      ),
    );
  }
}







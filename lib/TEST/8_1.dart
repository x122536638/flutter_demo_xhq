import 'package:flutter/material.dart';
import 'dart:ui';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {




  Widget redBox=DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {

    print(window.physicalSize.width );
    print('sdadadasdadasda');
    window.physicalSize.width;
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body:








        Container(
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Stack(
              alignment:Alignment.center ,
//            fit: StackFit.expand,
//          StackFit.expand, //未定位widget占满Stack整个空间
              children: <Widget>[
                Positioned(
                  left: 18.0,
                  child: Text("I am Jack"),
                ),
                Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
                  color: Colors.red,
                ),
                Positioned(
                  top: 18.0,
                  child: Text("Your friend"),
                )
              ],
            ),
          ),
        )
//          Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
//            color: Colors.red,
//          )

        ,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'dart:ui';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    print(window.physicalSize.width);
    print('sdadadasdadasda');
    window.physicalSize.width;
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: Container(
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Stack(
              alignment: Alignment.center,
//            fit: StackFit.expand,
//          StackFit.expand, //未定位widget占满Stack整个空间
              children: <Widget>[
                Stack(children: [
                  Container(
                    height: 40,
                    width: 40,
                    color: Colors.green,
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    color: Colors.red,
                  ),
                ],
                ),

//                 Container(height: 40,width: 40,color: Colors.green,)
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

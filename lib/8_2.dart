import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';
void main() {
  debugPaintSizeEnabled =true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {




//  Widget redBox=DecoratedBox(
//      decoration: BoxDecoration(color: Colors.red),
//  );

  Widget redBox=Container(
    color: Colors.red,
  );


  Widget redBox2=Container(
    color: Colors.yellow,
  );

  @override
  Widget build(BuildContext context) {

    print(window.physicalSize.width );
    print('sdadadasdadasda');
    window.physicalSize.width;
    return new MaterialApp(
//      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
          actions: <Widget>[
            UnconstrainedBox(
              child: SizedBox(

                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(Colors.white70),

                ),

                height: 20,
                width: 20,


              ),
            ),

          ],
        ),
        body:


//        ConstrainedBox(
//
//          //相当于这个约束  约束了下面child
////          constraints: BoxConstraints(minHeight: 50,minWidth: double.infinity),
//
//        constraints: BoxConstraints.tight(Size(80, 80)),
//          child: Container(
//            child: redBox,
//            height: 90,
//          ),
//
//
//
//
//
//        )

        ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
            child: UnconstrainedBox( //“去除”父级限制
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
                child: redBox,
              ),
            )
        )






        ,
      ),
    );
  }
}
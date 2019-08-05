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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Welcome to Flutter'),
      ),
//        body: Container(width:300,height:300,color:  Colors.red,child: XHQContainer(),),
//      body:
//      Container(
//        width: 300,
//        height: 300,
//        color: Colors.red,
//        child: Container(
//          color: Colors.orange,
//          width: 100,
//          height: 100,
//          child: Text('sssss'),
//        ),
//      ),


      body:
      Container(
        constraints: BoxConstraints(maxHeight: 100,maxWidth: 100),

        padding: EdgeInsets.all(20),
        width: 300,
        height: 300,
        color: Colors.red,
        child: SizedBox(
          width: 100,
          height: 100,
          child: Container(color: Colors.orange,child: Text('sssss')),
        ),
      ),
    );
  }
}

//class XHQContainer extends Container implements PreferredSizeWidget {
//
//  //为了实现container的尺寸
//  //如果写了一个container的子类 ,写法是这样的?
//  XHQContainer({
//    Key key,
//    alignment,
//    padding,
//    Color color,
//    Decoration decoration,
//    foregroundDecoration,
//    double width,
//    double height,
//    BoxConstraints constraints,
//    margin,
//    transform,
//    child,
//  }):super (key :key,alignment:alignment,color:color,child:child,width:width,height:height);
//
//  @override
//  // TODO: implement preferredSize
//  Size get preferredSize => Size(200, 200);//但是 实际效果会导致全屏
//}

class XHQContainer extends StatelessWidget implements PreferredSizeWidget {
  //为了实现container的尺寸
  //如果写了一个container的子类 ,写法是这样的?

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(200, 200);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
//      width: 200.0,
//      height: 100.0,
      color: Colors.yellow,
      child: CustomMultiChildLayout(
        delegate: TestLayoutDelegate(),
        children: <Widget>[
          LayoutId(
            id: TestLayoutDelegate.title,
            child: new Text("This is title",
                style: TextStyle(fontSize: 20.0, color: Colors.black)),
          ),
          LayoutId(
            id: TestLayoutDelegate.description,
            child: new Text("This is description",
                style: TextStyle(fontSize: 14.0, color: Colors.red)),
          ),
        ],
      ),
    );
  } //但是 实际效果会导致全屏
}

class TestLayoutDelegate extends MultiChildLayoutDelegate {
  TestLayoutDelegate();

  static const String title = 'title';
  static const String description = 'description';

  @override
  void performLayout(Size size) {
    final BoxConstraints constraints = new BoxConstraints(maxWidth: size.width);

    final Size titleSize = layoutChild(title, constraints);
    positionChild(title, new Offset(0.0, 0.0));

    final double descriptionY = titleSize.height;
    layoutChild(description, constraints);
    positionChild(description, new Offset(0.0, descriptionY * 12));
  }

  @override
  bool shouldRelayout(TestLayoutDelegate oldDelegate) => false;
}

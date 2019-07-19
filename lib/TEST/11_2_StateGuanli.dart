import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled =false;
  runApp(new MyApp2());
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
          ParentWidget(),
//          new Text('Hello World'),
        ),
      );
  }
}









class PartentWidgetB extends StatefulWidget {

  @override
  _PartentWidgetBState createState() => _PartentWidgetBState();
}

class _PartentWidgetBState extends State<PartentWidgetB> {

  //需求分析   一个widgetA点击 修改widgetA的状态  ,随着状态变化颜色变化


  //实现    子视图 是widgetA 父视图是widgetA的父视图


  //方案1 子视图包含手势widget,手势事件是外部传来,通过判断active 设置颜色  子视图 有active,手势事件的属性
  //父视图 需要实现手势事件  给子视图传active
  // 我的做法是修改父视图的active 但是网站上的 做法 多走了一层_handleTap ,active因为子视图也存着 所以点击的时候
  //子视图通过调用父视图的函数 来改变状态 有点绕,


//方案2 子视图包含手势widget,手势事件内部实现  子视图 有active,手势事件的实现  (这个是stateful的widget)


  bool _active = false;//TapBoxB 有个状态交给父类管理

  void _ff (bool v) {
    setState(() {
      _active = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxB(active: _active,changed: _ff,),
    );
  }
}

class TapBoxB extends StatelessWidget {

  final bool active;
//   (bool)() fuction1;
//  Function
  ValueChanged<bool> changed;
//  Function function;

//  void Function(bool value) ff;


  void _handleTap(){
    changed(!active);
  }

  TapBoxB({Key key, this.active,this.changed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 200,
          width: 200,
        color: active?Colors.red:Colors.black54,

      ),
      onTap: _handleTap,
    );
  }
}













//---------------------------- ParentWidget ----------------------------

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child:null,


    );
  }
}

//------------------------- TapboxA ----------------------------------

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

//------------------------- MyApp ----------------------------------

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Demo'),
        ),
        body: new Center(
          child:
          PartentWidgetB(),
//          new TapboxA(),
        ),
      ),
    );
  }
}




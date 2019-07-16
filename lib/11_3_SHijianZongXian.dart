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

  EventBus bus = new EventBus();

  String string = 'hello world';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bus.on("login", (arg) {
      // do something

      print('login了   $arg   ${this}');
      setState(() {

        string = arg;
      });



    });
  }

  @override
  Widget build(BuildContext context) {
    return
      new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          child:
            
            
            
           Column(
             children: <Widget>[
               Text(this.string),

             ],
           ),
        ),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.print), onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(fullscreenDialog: true,builder: (context) => NewRoute()));
        }
        ),
      );
  }
}

class NewRoute extends StatelessWidget {
  EventBus bus = new EventBus();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body:  new Center(
        child:



        Column(
          children: <Widget>[
            Text('Hello World 2'),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.print), onPressed: () {
        bus.emit("login", 'LOL');
      }
      ),
    );
  }
}




//订阅者回调签名
typedef void EventCallback(arg);

class EventBus {
  //私有构造函数
  EventBus._internal();

  //保存单例
  static EventBus _singleton = new EventBus._internal();

  //工厂构造函数
  factory EventBus()=> _singleton;

  //保存事件订阅者队列，key:事件名(id)，value: 对应事件的订阅者队列
  var _emap = new Map<Object, List<EventCallback>>();

  //添加订阅者
  void on(eventName, EventCallback f) {
    if (eventName == null || f == null) return;
    _emap[eventName] ??= new List<EventCallback>();
    _emap[eventName].add(f);
  }

  //移除订阅者
  void off(eventName, [EventCallback f]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  //触发事件，事件触发后该事件所有订阅者会被调用
  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) return;
    int len = list.length - 1;
    //反向遍历，防止在订阅者在回调中移除自身带来的下标错位 
    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Flutter Tutorial',
    home: new TutorialHome(),
  ));
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件.
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: new Text('Example title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      //body占屏幕的大部分
      body: new Center(
//        child: new Text('Hello, world!'),
//        child: new MyButton(),
      child: new Counter(),
      ),

      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}


class MyButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(

      onDoubleTap:(){
        print('双击');
      },
      onLongPress: (){
        print("长按");
      },
      child: new Container(
        child: new Center(
          child: new Text("engage"),
        ),
        height: 36.0,
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration:BoxDecoration(
          color: Colors.red,
//          borderRadius: BorderRadius.circular(5.0),
        borderRadius: BorderRadius.all(Radius.elliptical(100, 100)),
        ) ,
      ),
    );
  }
}


class Counter extends StatefulWidget {
  // This class is the configuration for the state. It holds the
  // values (in this nothing) provided by the parent and used by the build
  // method of the State. Fields in a Widget subclass are always marked "final".

  @override
  _CounterState createState() => new _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      // This call to setState tells the Flutter framework that
      // something has changed in this State, which causes it to rerun
      // the build method below so that the display can reflect the
      // updated values. If we changed _counter without calling
      // setState(), then the build method would not be called again,
      // and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance
    // as done by the _increment method above.
    // The Flutter framework has been optimized to make rerunning
    // build methods fast, so that you can just rebuild anything that
    // needs updating rather than having to individually change
    // instances of widgets.
    return new Row(
      children: <Widget>[

//        new ButtonBar(children: <Widget>[
//          new IconButton(icon: new Icon(Icons.map), onPressed: null),
//          new FlatButton(onPressed: null, child: new Text('flatButton')),
//        ],),
        new FlatButton(onPressed: (){print('11111');}, child: new Text('点我flatbutton')),
        new RaisedButton(
          onPressed: _increment,
          child: new Text('Incrementsss'),
        ),
        new Text('Count: $_counter'),
      ],
    );
  }
}
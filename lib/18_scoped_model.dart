import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp( ScopedModel(
    model:  CountModel(),
    child: MaterialApp(
      title: 'Flutter Tutorial',
      home: new TutorialHome(),
    ),
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
        onPressed: (){

          Navigator.push(context, new MaterialPageRoute(builder: (context) => new NewRoute()));//可以侧拉 ,
          //      Navigator.of(context).push(
          //                        MaterialPageRoute(fullscreenDialog: true,builder: (context) => NewRoute()));//不可以侧拉 是从底部跳上来,返回按钮是是X




        },
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



  void _increment() {

    final countModel = ScopedModel.of<CountModel>(context);
    countModel.increment();

    setState(() {
      // This call to setState tells the Flutter framework that
      // something has changed in this State, which causes it to rerun
      // the build method below so that the display can reflect the
      // updated values. If we changed _counter without calling
      // setState(), then the build method would not be called again,
      // and so nothing would appear to happen.
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

    final countModel = ScopedModel.of<CountModel>(context);
    return new Row(
      children: <Widget>[

//        new ButtonBar(children: <Widget>[
//          new IconButton(icon: new Icon(Icons.map), onPressed: null),
//          new FlatButton(onPressed: null, child: new Text('flatButton')),
//        ],),
//        new RaisedButton(
//          onPressed: _increment,
//          child: new Text('Incrementsss'),
//        ),
//        new Text('Count: $_counter'),
      new CounterIncrementor(onPressed: _increment),
      new CountDisplay(count: countModel.count,),
      ],
    );
  }
}


//显示数据的Widget
class CountDisplay extends StatelessWidget{


  final int count;

  CountDisplay({this.count});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Text('Count $count');
  }

}


class CounterIncrementor extends StatelessWidget {


  final VoidCallback onPressed;
  CounterIncrementor({this.onPressed});
  @override
  Widget build(BuildContext context) {
    return  new RaisedButton(onPressed: onPressed,child: new Text("increment"),);
//      new RaisedButton.icon(onPressed: onPressed, label: new Text("increment"));
  }
}



class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

class CountModel extends Model{
  int _count = 0;
  get count => _count;

  void increment(){
    _count++;
    notifyListeners();
  }

  CountModel of(context) =>
      ScopedModel.of<CountModel>(context);
}

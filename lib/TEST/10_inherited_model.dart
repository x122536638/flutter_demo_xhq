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
      body: new Center(
        child:
//          InheritedContext(inheritedTestModel, increment, reduce)
//          new Text('Hello World'),

//        Container(child: Column(children: <Widget>[
//          TestWidgetA(),
//          TestWidgetB(),
//          TestWidgetC()
//        ],),),

            InheritedWigetTestContainer(),
      ),
    );
  }
}

class InheritedWigetTestContainer extends StatefulWidget {
  @override
  _InheritedWigetTestContainerState createState() =>
      _InheritedWigetTestContainerState();
}

class _InheritedWigetTestContainerState
    extends State<InheritedWigetTestContainer> {
  InheritedTestModel model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('_InheritedWigetTestContainerState    initstate');
  }

  f1() {
    setState(() {
//      model = InheritedTestModel(model.count + 1);
    });
  }

  f2() {
    setState(() {
//      model = InheritedTestModel(model.count - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
//
//    return InheritedContext(model, f1, f2,  Container(child: Column(children: <Widget>[
//      TestWidgetA(),
//      TestWidgetB(),
//      TestWidgetC()
//    ],),)
//    );

    return InheritedTestModel(
//        inheritedTestModel: model,
//        increment: f1,
//        reduce: f2,
        count: 1,
        count2: 100,
        child: Container(
          child: Column(
            children: <Widget>[TestWidgetA(), TestWidgetB(), TestWidgetC()],
          ),
        ));
  }
}

class InheritedTestModel extends InheritedModel{
   int count;
   int count2;

   InheritedTestModel({Key key,this.count, this.count2,@required Widget child}) : super(key: key, child: child);


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return null;
  }

  @override
  bool updateShouldNotifyDependent(InheritedTestModel oldWidget, Set dependencies) {
    // TODO: implement updateShouldNotifyDependent
    if(dependencies.contains('count')&&count != oldWidget.count){
      return true;
    }
    if(dependencies.contains('count2')&&count2 != oldWidget.count2){
      return true;
    }
    return false;
  }
}

//class InheritedContext extends InheritedWidget {
//  final InheritedTestModel inheritedTestModel;
//  final Function() increment;
//  final Function() reduce;
//
//  InheritedContext({
//    Key key,
//    @required this.inheritedTestModel,
//    @required this.increment,
//    @required this.reduce,
//    @required Widget child,
//  }) : super(key: key, child: child);
//
////  InheritedContext({
////    @required this.inheritedTestModel,
////    @required this.increment,
////    @required this.reduce,
////    @required Widget child,
////  }) : super(child: child);
//
////  InheritedContext(this.inheritedTestModel, this.increment, this.reduce,Widget child)
////  :super(child:child);
//
//  static InheritedContext of(BuildContext context) {
//    return context.inheritFromWidgetOfExactType(InheritedContext);
//  }
//
//  //是否重建这个会导致所有相关子widget重建
//  @override
//  bool updateShouldNotify(InheritedContext oldWidget) {
//    // TODO: implement updateShouldNotify
//    return inheritedTestModel != oldWidget.inheritedTestModel;
//  }
//
//}

class TestWidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final inheritedContext = InheritedContext.of(context);
//    final inhertiedTsetModel = inheritedContext.inheritedTestModel;
//
//    print('TestWidgetA 中的值 ${inhertiedTsetModel.count}');
    InheritedTestModel model = InheritedModel.inheritFrom<InheritedTestModel>(context,aspect: 'count2');

    return Padding(
      padding: EdgeInsets.all(10),
      child: RaisedButton(
        onPressed: (){model.count2++;},
        child: Text('+'),
      ),
    );
  }
}

class TestWidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final inheritedContext = InheritedContext.of(context);
//
//    final inheritedTestModel = inheritedContext.inheritedTestModel;

    InheritedTestModel model = InheritedModel.inheritFrom<InheritedTestModel>(context,aspect: 'count2');

//    print('TestWidgetB 中count的值:  ${inheritedTestModel.count}');

    return new Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: new Text(
//        'ss',
        '当前count:${model.count2}',
        style: new TextStyle(fontSize: 20.0),
      ),
    );
  }
}

class TestWidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final inheritedContext = InheritedContext.of(context);
//
//    final inheritedTestModel = inheritedContext.inheritedTestModel;
    InheritedTestModel model = InheritedModel.inheritFrom<InheritedTestModel>(context,aspect: 'count2');


    return new Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: new RaisedButton(
          textColor: Colors.black,
          child: new Text('-'),
          onPressed:(){model.count2--;}),
    );
  }
}

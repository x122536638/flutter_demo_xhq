import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
//  @override
  Widget build(BuildContext context) {
    Row r1 = new Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(
          'Baseline',
          style: Theme.of(context).textTheme.display3,
        ),
        Text(
          'Baseline',
          style: Theme.of(context).textTheme.body1,
        ),
      ],
    );

    Row r2 = Row /*或 Column*/ (
//      crossAxisAlignment: CrossAxisAlignment.stretch,
//    crossAxisAlignment: CrossAxisAlignment.stretch,//让Row填充父视图?
      mainAxisSize: MainAxisSize.min,

      children: <Widget>[
        Icon(Icons.star, size: 50),
        Icon(Icons.star, size: 50),

//        new Expanded(child:         Icon(Icons.star, size: 200),),
        Icon(Icons.star, size: 50),
      ],
    );

//IntrinsicWidth 的宽度 等于最宽的元素的宽度
    IntrinsicWidth i1 = IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {},
            child: Text('Short'),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('A bit Longer'),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('The Longest text button'),
          ),
        ],
      ),
    );

    Stack s1 = Stack(
      fit: StackFit.expand,
      children: <Widget>[
//            Material(color: Colors.yellowAccent),


        Container(
          width: 100,

          height: 200,

          color: Colors.red,
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Icon(Icons.star, size: 50),
        ),
        Positioned(
          top: 340,
          left: 250,
          child: Icon(Icons.call, size: 50),
        ),
//            Material(color: Colors.yellow,),
      ],
    );

    Widget main = Scaffold(
      appBar: AppBar(title: Text('Stack')),
    );

    Widget s2 = Stack(
      fit: StackFit.expand,
      children: <Widget>[
        main,
        Banner(
          message: "Top Start",
          location: BannerLocation.topStart,
        ),
        Banner(
          message: "Top End",

          location: BannerLocation.topEnd,
        ),
        Banner(
          message: "Bottom Start",
          location: BannerLocation.bottomStart,
        ),
        Banner(
          message: "Bottom End",
          location: BannerLocation.bottomEnd,
        ),
      ],
    );


    Scaffold s3 = Scaffold(
      appBar: AppBar(title: Text('Stack with LayoutBuilder')),
      body: LayoutBuilder(
        builder: (context, constraints) =>
            Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Material(color: Colors.yellowAccent),
                Positioned(
                  top: 0,
                  child: Icon(Icons.star, size: 50),
                ),
                Positioned(
                  top: constraints.maxHeight - 50,
                  left: constraints.maxWidth - 50,
                  child: Icon(Icons.call, size: 50),
                ),
              ],
            ),
      ),
    );

    return new MaterialApp(
      title: 'Welcome to Flutter',
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter'),
//        ),
//        body: new Container(
//          child: r2,
//          color: Colors.yellow,
//        ),
//      ),

      home:s3,

//      Scaffold(
//        appBar: AppBar(title: Text('IntrinsicWidth')),
//        body: Center(
//          child: s2,
//        ),
//      ),
    );
  }
}

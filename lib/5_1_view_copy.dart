import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //

    Widget w2 = new Container(
      //容器
//      color: Colors.white,
      padding: EdgeInsets.all(32),
      child: new Row(
        //行
        children: <Widget>[
          //
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
//              new Text('di yihang wenben'),
              new Container(
                padding: EdgeInsets.only(bottom: 8),
                child:   new Text('di yihang wenben',style: TextStyle(fontWeight: FontWeight.bold),),

              ),


              new Text("dierhang wenben"),
            ],
          )),
          new Icon(Icons.star,color: Colors.red,),
          new Text("41"),
        ],
      ),
    );

    //底部单个按钮

    Column buildBottomColumn(IconData icondata, String label) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(
            icondata,
            color: color,
          ),
          new Container(
            margin: EdgeInsets.only(top: 8),
            child: new Text(label,style: TextStyle(color: color,fontSize: 12,fontWeight: FontWeight.w600),),
              
          ),
        ],
      );
    }

    Widget buttonSection = new Container(
//      padding: EdgeInsets.symmetric(horizontal: 8),

      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget>[
          buildBottomColumn(Icons.cached, 'call'),
          buildBottomColumn(Icons.cached, 'call'),
          buildBottomColumn(Icons.cached, 'call'),
        ],
      ),
    );

    //多行文本

    Widget textSection = new Container(
      padding: EdgeInsets.all(32),
      child: new Text(
        "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.",
        softWrap: true,
      ),
    );

    return new MaterialApp(
      home: new Scaffold(
        body: new ListView(
          children: <Widget>[
            new Image.asset('images/11.png'),
            w2,
            buttonSection,
            textSection,
          ],
        ),
      ),
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

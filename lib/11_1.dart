import 'package:flutter/material.dart';

void main() => runApp(new MyApp());



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      // If the lake is currently favorited, unfavorite it.
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
        // Otherwise, favorite it.
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    //widget2

    Widget widget2 = new Container(
      padding: EdgeInsets.all(32),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
//        mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    child: new Text(
                      "dadadasdasdasd  daadadaad",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    padding: EdgeInsets.only(bottom: 8),
                  ),
                  new Text("第二行文本lsdllsdaddd"),
                ],
              )),
          IconButton(

            icon: _isFavorited?Icon(Icons.star):Icon(Icons.star_border),
            color: Colors.blue,
            onPressed: _toggleFavorite,
          ),
          new Text(
            '$_favoriteCount',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );

//widge3

    Column buildbutton(IconData icondata, String str) {
      return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(
            icondata,
            color: Theme.of(context).primaryColor,
          ),
          new Container(
            margin: EdgeInsets.only(top: 8),
            child: new Text(
              str,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      );
    }

    Row buttonsection = new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildbutton(Icons.print, "trsss"),
        buildbutton(Icons.print, "trsss"),
        buildbutton(Icons.print, "trsss"),
        buildbutton(Icons.print, "trsss"),
      ],
    );

    Widget textSection = new Container(
      padding: EdgeInsets.all(32),
      child: new Text(
        "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.",
        softWrap: true,
      ),
    );

    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        body: new ListView(
          children: <Widget>[
            new Image.asset("images/11.png", height: 400, fit: BoxFit.cover),
            widget2,
            buttonsection,
            textSection,
          ],
        ),
      ),
    );
  }
}


//class MyApp2 extends StatelessWidget {
//
//}

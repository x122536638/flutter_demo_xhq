
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_xhq1/MEIQO/Bean/Book.dart';
import 'dart:convert';

import 'MainPageSub1.dart';






class GoodDetialVC extends StatefulWidget {
  ListItem item;

  GoodDetialVC(this.item);

  @override
  _GoodDetialVCState createState() => _GoodDetialVCState();
}

class _GoodDetialVCState extends State<GoodDetialVC> {


  @override
  void initState() {
    // TODO: implement initState

    loaddata();

//    Book.fromJsonMap();
  }


  loaddata() async {
   String string = await DefaultAssetBundle.
    of(context).
    loadString('lib/MEIQO/1.json');
   Map valueMap = json.decode(string);

   var book = Book.fromJsonMap(valueMap);



   print(book.title);
  }





  @override
  Widget build(BuildContext context) {



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
          GestureDetector(
            onTap: (){
              setState(() {
                
              });
              widget.item.islike =!widget.item.islike;
            },
            child: new Icon(
              Icons.star,
              color:  widget.item.islike?Colors.red:Colors.black38,
            ),
          ),
          new Text(
            '41',
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



    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.title),
      ),
      body: new ListView(
        children: <Widget>[
          new Image.asset(widget.item.image, height: 400, fit: BoxFit.cover),
          widget2,
          buttonsection,
          textSection,
        ],
      ),
    );
  }


}

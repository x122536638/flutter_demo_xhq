
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_xhq1/MEIQO/Bean/Book.dart';
import 'dart:convert';

class GoodDetialVC extends StatefulWidget {
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

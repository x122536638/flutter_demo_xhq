import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to Flutter222',
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return null;
//
//  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Welcome to Flutter333'),
      ),
      body: new Center(
        //child: new Text('Hello World'),
//          child: new Text(wordPair.asPascalCase),
        child: new Scaffold(
          body: new Container(

              ///四周10大小的maring
              margin: EdgeInsets.all(10.0),
              height: 120.0,
              width: 500.0,

              ///透明黑色遮罩
              ///
              ///
              ///

              decoration: new BoxDecoration(

                  ///弧度为4.0
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),

                  ///设置了decoration的color，就不能设置Container的color。
                  color: Colors.yellow,

                  ///边框
                  border: new Border.all(color: Colors.red, width: 2.3)),
              child: new Text("666666")),
        ),
      ),
    );
  }
  //这个是什么语法

}

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
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  //这个是什么语法

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  Set _like = new Set<WordPair>();

  Widget _buildSuggestion() {
    return new ListView.builder(
      itemBuilder: (context, i) {
        print(i);
        if (i.isOdd) return new Divider(); //如果i是奇数 返回一条线
        final index = i ~/ 2; //如果是偶数
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _suggestions.length > 0 ? _buildRow(_suggestions[index]) : null;
      },
      padding: const EdgeInsets.all(16.0),
    );
  }

  Widget _buildRow(WordPair pair) {
    final isLike = _like.contains(pair);
    return new ListTile(
      title: new Text(pair.asPascalCase, style: _biggerFont),
      trailing: new Icon(
        isLike ? Icons.favorite : Icons.favorite_border,
        color: isLike ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          _like.contains(pair) ? _like.remove(pair) : _like.add(pair);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    final wordPair =new WordPair.random();
//    return new Text(wordPair.asPascalCase);

//    _buildSuggestion();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Welcome to Flutter333'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: new Center(
        //child: new Text('Hello World'),
//          child: new Text(wordPair.asPascalCase),
        child: new Scaffold(body: _buildSuggestion()),
      ),
    );

//      new Scaffold(body: _buildSuggestion());
  }

  _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      final titles = _like.map((obj) {
        return new ListTile(
          title: new Text(
            obj.asPascalCase,
            style: _biggerFont,
          ),
        );
      });

      var divideTiles =
          ListTile.divideTiles(context: context, tiles: titles).toList();

      return new Scaffold(
        appBar: new AppBar(
          title: new Text("likes"),
        ),
        body: new ListView(children: divideTiles),
      );
    }));
  }
}

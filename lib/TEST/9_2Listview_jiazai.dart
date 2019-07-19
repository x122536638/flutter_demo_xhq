//import 'package:english_words/english_words.dart';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
//  debugPaintSizeEnabled =true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(color: Colors.green);

    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
            child: Center(
                child:
//            ListView3(),
//            ListView.builder(
//                itemCount:  100,
//                itemExtent: 50,
//                itemBuilder: (BuildContext context, int index){
//                    return ListTile(title: Text('$index'),);
//            })

//                  ListView.separated(
//                      itemBuilder: (BuildContext context, int index) {
//                        return ListTile();
//                      },
//                      separatorBuilder: (BuildContext context, int index) {
//                        return index%2==0 ? divider1:divider2;
//                      },
//                      itemCount: 100)),

                    InfiniteListView())),
      ),
    );
  }
}

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
//    _retrieveData();
  }



  void _retrieveData() {


    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        //重新构建列表
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
        itemBuilder: (BuildContext context, int index){
//加载信号
        if(_words[index] ==loadingTag){//显示数组底部时候
          //加载数据  并且数组小于101的时候才加载
          print('kakakak');
          if(_words.length -1 <100){//数组里最多 100+1条  所以当是101的时候显示加载完成
            //小于101显示菊花
            _retrieveData();
            print('加载数据 build');

            return Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(

                ),
              ),
            );
          }else{
            return Text('没有更多数据');
          }
        }else{//显示正常字符串 数据
          return  ListTile(
            title: Text(_words[index]),
          );


        }



        },
        separatorBuilder: (BuildContext context, int index){
          return Divider();
        },
        //问题就是item包括了 加载状态的view
        itemCount: _words.length);
  }
}

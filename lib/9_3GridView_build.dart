import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          child:InfiniteGridView(),
//          GridView(
//              gridDelegate:
//              SliverGridDelegateWithMaxCrossAxisExtent(
//                  maxCrossAxisExtent: 1000.0,//流动方向交叉方向的 宽度
//                  childAspectRatio: 2.0 //
//              ),
//
//
////              SliverGridDelegateWithFixedCrossAxisCount(
////                  crossAxisCount: 3, //横轴三个子widget
////                  childAspectRatio: 1.0 , //宽高比为1时，子widget
////                crossAxisSpacing: 200,
////                  ),
//              children: <Widget>[
//                Icon(Icons.ac_unit),
//                Icon(Icons.airport_shuttle),
//                Icon(Icons.all_inclusive),
//                Icon(Icons.beach_access),
//                Icon(Icons.cake),Icon(Icons.ac_unit),
//                Icon(Icons.airport_shuttle),
//                Icon(Icons.all_inclusive),
//                Icon(Icons.beach_access),
//                Icon(Icons.cake),Icon(Icons.ac_unit),
//                Icon(Icons.airport_shuttle),
//                Icon(Icons.all_inclusive),
//                Icon(Icons.beach_access),
//                Icon(Icons.cake),Icon(Icons.ac_unit),
//                Icon(Icons.airport_shuttle),
//                Icon(Icons.all_inclusive),
//                Icon(Icons.beach_access),
//                Icon(Icons.cake),
//                Icon(Icons.free_breakfast)
//              ],
////            scrollDirection: Axis.horizontal,
//          ),
        ),
      ),
    );
  }
}


class InfiniteGridView extends StatefulWidget {
  @override
  _InfiniteGridViewState createState() => new _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {

  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    // 初始化数据
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      childAspectRatio: 2,
      crossAxisCount: 3,
    ),
        itemCount: _icons.length,
        itemBuilder: (BuildContext context, int index){

      //
          if(index == _icons.length-1){
            _retrieveIcons();
          }

      return Icon(_icons[index]);
    });
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access, Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}

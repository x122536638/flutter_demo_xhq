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

                  ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile();
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return index%2==0 ? divider1:divider2;
                      },
                      itemCount: 100)),
        ),
      ),
    );
  }
}

class ListView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(color: Colors.green);
    return ListView.separated(
      itemCount: 100,
      //列表项构造器
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
    );
  }
}

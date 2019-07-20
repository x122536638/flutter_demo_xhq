import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GoodDetialVC.dart';
import 'dart:math';

class MainPageSub1 extends StatefulWidget {
  @override
  _MainPageSub1State createState() => _MainPageSub1State();
}

class _MainPageSub1State extends State<MainPageSub1>
    with AutomaticKeepAliveClientMixin ,SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];
//  List tabs = ["新闻"];
  List getTabList() {
    return tabs
        .map((e) => Tab(

      text: e,
    ))
        .toList();
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: tabs.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return

       Container(
          color: Colors.red,
          child: Container(
            child: Column(
              children: <Widget>[
//          GridView(scrollDirection: Axis.horizontal,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),),

                Container(
                  height: 40,
                  child: TabBar(controller: _tabController, tabs: getTabList()),
//                GridView(
////              shrinkWrap:true,
//                  scrollDirection: Axis.horizontal,
//                  gridDelegate:
////                SliverGridDelegateWithMaxCrossAxisExtent(
////                    maxCrossAxisExtent: 1000000.0,//流动方向交叉方向的 宽度
////
////                    childAspectRatio: 2.0 //
////                ),
//
//                      SliverGridDelegateWithFixedCrossAxisCount(
//                    crossAxisCount: 1, //横轴三个子widget
//                    childAspectRatio: 1.0, //宽高比为1时，子widget
//                    crossAxisSpacing: 200,
//                  ),
//                  children: <Widget>[
//                    Icon(Icons.ac_unit),
//                    Icon(Icons.airport_shuttle),
//                    Icon(Icons.all_inclusive),
//                    Icon(Icons.beach_access),
//                    Icon(Icons.cake),
//                    Icon(Icons.ac_unit),
//                    Icon(Icons.airport_shuttle),
//                    Icon(Icons.all_inclusive),
//                    Icon(Icons.beach_access),
//                    Icon(Icons.cake),
//                    Icon(Icons.ac_unit),
//                    Icon(Icons.airport_shuttle),
//                    Icon(Icons.all_inclusive),
//                    Icon(Icons.beach_access),
//                    Icon(Icons.cake),
//                    Icon(Icons.ac_unit),
//                    Icon(Icons.airport_shuttle),
//                    Icon(Icons.all_inclusive),
//                    Icon(Icons.beach_access),
//                    Icon(Icons.cake),
//                    Icon(Icons.free_breakfast)
//                  ],
////            scrollDirection: Axis.horizontal,
//                ),
                ),



                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.deepPurpleAccent,
                    child: TabBarView(

                      controller: _tabController,
                      children: tabs.map((e) {
                        return Container(
                          alignment: Alignment.center,
                          child:
                          GridViewPage(),

//                        Text(
//                          e,
//                          textScaleFactor: 5,
//                        ),
                        );
                      }).toList(),
                    ),
                  ),
                ),



              ],
            ),
          ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

//  get mainGridView {
//    return grad
////      GridView.builder(gridDelegate: null, itemBuilder: null)
//  }

}




class GridViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GridViewState();
  }
}

class GridViewState extends State<GridViewPage> with AutomaticKeepAliveClientMixin {
  final List<ListItem> listData = [];
//  images/jay.jpg

  List list = ['images/jay.jpg','images/pic3.jpg'];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 20; i++) {
      listData.add(new ListItem("我是测试标题$i", Icons.cake,list[Random().nextInt(2)]));
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
//      appBar: AppBar(
//        title: Text('GridView'),
//      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //每行2个
            mainAxisSpacing: 10.0, //主轴(竖直)方向间距
            crossAxisSpacing: 10.0, //纵轴(水平)方向间距
            childAspectRatio: 1.0 //纵轴缩放比例
        ),
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {

          return ListItemWidget(listItem: listData[index],index: index,)
            ..onClick = _click;

        },
      ),
    );
  }

//  typedef CallBackInt = void Function(int);

  Function _click(int index){
    print('lalalal');

    ListItem item = listData[index];

    Navigator.push(context, new MaterialPageRoute(builder: (context) => new GoodDetialVC(item)));//可以侧拉 ,


  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class ListItem {
  bool islike = false;
  final String title;
  final IconData iconData;
  final String image;

  ListItem(this.title, this.iconData,this.image);
}



class ListItemWidget extends StatefulWidget {
  final ListItem listItem;
  final int index;
  void Function(int) onClick;


  ListItemWidget({this.listItem, this.index});

  @override
  _ListItemWidgetState createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {






  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
                tag: widget.listItem,
                child: Image(
                  image: AssetImage(widget.listItem.image
                  ),
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.fill,
                  /*listItem.iconData,
                size: 50.0,
                color: Colors.white,*/
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      widget.listItem.title,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  GestureDetector(child: Icon(Icons.star_border,color: widget.listItem.islike?Colors.red:Colors.black26),onTap: (){
                    widget.listItem.islike = !widget.listItem.islike;
                    setState(() {

                    });
                  },),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        /*Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text(listItem.title),
        ));*/
//        Navigator.of(context).push(PageRouteBuilder(pageBuilder:
//            (BuildContext context, Animation<double> animation,
//            Animation<double> secondaryAnimation) {
//          return Scaffold(
//
//            body: Center(child: Text(listItem.title)),
//          );


//        listData[i];

        widget.onClick(widget.index);
//        Navigator.push(context, new MaterialPageRoute(builder: (context) => new GoodDetialVC()));//可以侧拉 ,

//      Navigator.of(context).push(
//                        MaterialPageRoute(fullscreenDialog: true,builder: (context) => NewRoute()));//不可以侧拉 是从底部跳上来,返回按钮是是X







//            MyHomePage(tag: listItem.title);
//        }));

      },
    );
  }
}

//class ListItemWidget extends StatelessWidget {
//  final ListItem listItem;
//  final int index;
//  void Function(int) onClick;
//
//
//
//
//  ListItemWidget(this.listItem, this.index);
//
//  @override
//  Widget build(BuildContext context) {
//    return GestureDetector(
//      child: Container(
//        color: Colors.green,
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Hero(
//                tag: listItem,
//                child: Image(
//                  image: AssetImage(listItem.image
//                      ),
//                  width: 150.0,
//                  height: 150.0,
//                  fit: BoxFit.fill,
//                  /*listItem.iconData,
//                size: 50.0,
//                color: Colors.white,*/
//                )),
//            Padding(
//              padding: const EdgeInsets.symmetric(horizontal: 20),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Expanded(
//                    child: Text(
//                      listItem.title,
//                      style: TextStyle(color: Colors.white),
//                    ),
//                  ),
//                  FlatButton(child: Icon(Icons.star_border,color: listItem.islike?Colors.red:Colors.black26),onPressed: (){
//                    listItem.islike = !listItem.islike;
//                  },),
//                ],
//              ),
//            )
//          ],
//        ),
//      ),
//      onTap: () {
//        /*Scaffold.of(context).showSnackBar(new SnackBar(
//          content: new Text(listItem.title),
//        ));*/
////        Navigator.of(context).push(PageRouteBuilder(pageBuilder:
////            (BuildContext context, Animation<double> animation,
////            Animation<double> secondaryAnimation) {
////          return Scaffold(
////
////            body: Center(child: Text(listItem.title)),
////          );
//
//
////        listData[i];
//
//      onClick(index);
////        Navigator.push(context, new MaterialPageRoute(builder: (context) => new GoodDetialVC()));//可以侧拉 ,
//
////      Navigator.of(context).push(
////                        MaterialPageRoute(fullscreenDialog: true,builder: (context) => NewRoute()));//不可以侧拉 是从底部跳上来,返回按钮是是X
//
//
//
//
//
//
//
////            MyHomePage(tag: listItem.title);
////        }));
//
//      },
//    );
//  }
//}




class PPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



class NewRoute extends StatelessWidget {
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
          new Icon(
            Icons.star,
            color: Colors.red,
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
        title: Text("New route"),
      ),
      body: new ListView(
        children: <Widget>[
          new Image.asset("images/11.png", height: 400, fit: BoxFit.cover),
          widget2,
          buttonsection,
          textSection,
        ],
      ),
    );
  }
}



//class NewRoute extends StatelessWidget {
//  ValueChanged<int> callbackAction;
//  NewRoute(this.callbackAction);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("New route"),
//      ),
//      body: Center(
//        child: FlatButton(
//          child: Text("This is new route"),
//          onPressed: () {
//            //要传值给上个界面
//            if (callbackAction != null) {
//              print('在A界面中输出');
//              callbackAction(100);
//            }
//          },
//        ),
//      ),
//    );
//  }
//}


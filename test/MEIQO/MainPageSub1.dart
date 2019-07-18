import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Container(
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

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 20; i++) {
      listData.add(new ListItem("我是测试标题$i", Icons.cake));
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
          return ListItemWidget(listData[index], index);
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class ListItem {
  final String title;
  final IconData iconData;

  ListItem(this.title, this.iconData);
}

class ListItemWidget extends StatelessWidget {
  final ListItem listItem;
  final int index;
  ListItemWidget(this.listItem, this.index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
                tag: listItem,
                child: Image(
                  image: AssetImage(
                      index == 5 ? 'images/jay.jpg' : 'images/pic3.jpg'),
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.fill,
                  /*listItem.iconData,
                size: 50.0,
                color: Colors.white,*/
                )),
            Text(
              listItem.title,
              style: TextStyle(color: Colors.white),
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


        Navigator.push(context, new MaterialPageRoute(builder: (context) => new NewRoute()));//可以侧拉 ,
//      Navigator.of(context).push(
//                        MaterialPageRoute(fullscreenDialog: true,builder: (context) => NewRoute()));//不可以侧拉 是从底部跳上来,返回按钮是是X







//            MyHomePage(tag: listItem.title);
//        }));

      },
    );
  }
}




class PPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



class NewRoute extends StatelessWidget {
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


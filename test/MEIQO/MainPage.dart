


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MainPageSub1.dart';

//class MainPage extends StatefulWidget {
//  @override
//  _MainPageState createState() => _MainPageState();
//}
//
//class _MainPageState extends State<MainPage> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: Colors.red,
//    );
//  }
//}
class MainPage extends StatefulWidget {
  @override

//  @override
  _MainPageState createState() => _MainPageState();



}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  static GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  //
  TabController _tabController;
  PageController pageController = PageController(initialPage: 0);

  List tabs = ["新闻", "历史", "图片"];

//  List pages =['MainPageSub1','MainPageSub1','MainPageSub1'];//问题 这个报错啊
//  List pages =[MainPageSub1,MainPageSub1,MainPageSub1];//问题 这个报错啊
  List pages =[MainPageSub1(),MainPageSub1(),MainPageSub1()];


  int _selectedIndex = 1;
  int _currentPageViewIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text("app name"),
//        leading: Icon(Icons.add),//这么加的话 侧拉效果就没了
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print('anniu 1');
//              Scaffold.of(context).openDrawer();//获取state的一种方法

              _globalKey.currentState.openDrawer();
            },

//
          );
        }),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
          ),
        ],
//        bottom: TabBar(controller: _tabController, tabs: getTabList()),
      ),
      drawer: new MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School')),
        ],
        currentIndex: _currentPageViewIndex,
        onTap:onTap,// _onItemTapped,
      ),
//          BottomAppBar(
//        color: Colors.white,
//        shape: CircularNotchedRectangle(),
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceAround,
//          children: <Widget>[
//            IconButton(icon: Icon(Icons.home)),
//            SizedBox(), //中间位置空出
//            IconButton(icon: Icon(Icons.business)),
//          ],
//        ),
//      ),
      body: new PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return
//            MainPageSub1();
              pages[index];//这个报错啊
            //Text(tabs[index]);
//            index == 1 ? new Text("page1") : new Text('Page2');
        },
        onPageChanged: _pageChange,
        controller: pageController,
        itemCount: tabs.length,

      ),

//      TabBarView(
//        controller: _tabController,
//        children: tabs.map((e) {
//          return Container(
//            alignment: Alignment.center,
//            child: Text(
//              e,
//              textScaleFactor: 5,
//            ),
//          );
//        }).toList(),
//      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  List getTabList() {
    return tabs
        .map((e) => Tab(
      text: e,
    ))
        .toList();
  }

  void _onItemTapped(int value) {
    //好神奇啊,

    setState(() {
      _selectedIndex = value;
    });
  }


// bottomnaviagtionbar 和 pageview 的联动
  void onTap(int index) {
    // 过pageview的pagecontroller的animateToPage方法可以跳转
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 1), curve: Curves.ease);
  }



  //切换pageview
  void _pageChange(int index) {
    setState(() {
      if (_currentPageViewIndex != index) {
        _currentPageViewIndex = index;
      }
    });
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // DrawerHeader consumes top MediaQuery padding.
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
//                        "imgs/avatar.png",
                        "images/11.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

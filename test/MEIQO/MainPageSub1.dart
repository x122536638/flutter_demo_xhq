import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPageSub1 extends StatefulWidget {
  @override
  _MainPageSub1State createState() => _MainPageSub1State();
}


class _MainPageSub1State extends State<MainPageSub1> with AutomaticKeepAliveClientMixin  {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: Container(


          child:



          ListView(
          children: <Widget>[

//          GridView(scrollDirection: Axis.horizontal,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),),



          Container(
            height: 150,
            child: GridView(
//              shrinkWrap:true,
              scrollDirection: Axis.horizontal,
              gridDelegate:
//                SliverGridDelegateWithMaxCrossAxisExtent(
//                    maxCrossAxisExtent: 1000000.0,//流动方向交叉方向的 宽度
//
//                    childAspectRatio: 2.0 //
//                ),


              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, //横轴三个子widget
                  childAspectRatio: 1.0 , //宽高比为1时，子widget
                crossAxisSpacing: 200,
                  ),
                children: <Widget>[
                  Icon(Icons.ac_unit),
                  Icon(Icons.airport_shuttle),
                  Icon(Icons.all_inclusive),
                  Icon(Icons.beach_access),
                  Icon(Icons.cake),Icon(Icons.ac_unit),
                  Icon(Icons.airport_shuttle),
                  Icon(Icons.all_inclusive),
                  Icon(Icons.beach_access),
                  Icon(Icons.cake),Icon(Icons.ac_unit),
                  Icon(Icons.airport_shuttle),
                  Icon(Icons.all_inclusive),
                  Icon(Icons.beach_access),
                  Icon(Icons.cake),Icon(Icons.ac_unit),
                  Icon(Icons.airport_shuttle),
                  Icon(Icons.all_inclusive),
                  Icon(Icons.beach_access),
                  Icon(Icons.cake),
                  Icon(Icons.free_breakfast)
                ],
//            scrollDirection: Axis.horizontal,
            ),
          ),



            FlatButton(onPressed: (){

            print('按钮点击了');
            Navigator.of(context).push(
                MaterialPageRoute(fullscreenDialog: true,builder: (context) => NewRoute()));




            }, child: Text('按钮')),
            Text("sss",textScaleFactor: 10,),
            Text("sss",textScaleFactor: 10,),
            Text("sss",textScaleFactor: 10,),
            Text("sss",textScaleFactor: 10,),
            Text("sss",textScaleFactor: 10,),
            Text("sss",textScaleFactor: 10,),


          ],

          ),




        )
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}




//class _MainPageSub1State extends State<MainPageSub1> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: Colors.red,
//      child: Container(
//
//
//        child:
//        CustomScrollView(
//          slivers: <Widget>[
//            //AppBar，包含一个导航栏
//
//
////            GridView(scrollDirection: Axis.horizontal,children: <Widget>[
////              Icon(Icons.star,size: 80 ,)
////        gridDelegate:,
////
////            ],),
//
//            SliverPadding(
//              padding: const EdgeInsets.all(8.0),
//              sliver: new SliverGrid( //Grid
//                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
//                  crossAxisCount: 2, //Grid按两列显示
//                  mainAxisSpacing: 10.0,
//                  crossAxisSpacing: 10.0,
//                  childAspectRatio: 4.0,
//
//                ),
//                delegate: new SliverChildBuilderDelegate(
//                      (BuildContext context, int index) {
//                    //创建子widget
//                    return new Container(
//                      alignment: Alignment.center,
//                      color: Colors.cyan[100 * (index % 9)],
//                      child: new Text('grid item $index'),
//                    );
//                  },
//                  childCount: 20,
//                ),
//              ),
//            ),
//            //List
//
//            SliverGrid( //Grid
//              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 2, //Grid按两列显示
//                mainAxisSpacing: 10.0,
//                crossAxisSpacing: 10.0,
//                childAspectRatio: 4.0,
//              ),
//              delegate: new SliverChildBuilderDelegate(
//                    (BuildContext context, int index) {
//                  //创建子widget
//                  return new Container(
//                    alignment: Alignment.center,
//                    color: Colors.cyan[100 * (index % 9)],
//                    child: new Text('grid item $index'),
//                  );
//                },
//                childCount: 20,
//              ),
//            ),
//            new SliverFixedExtentList(
//              itemExtent: 50.0,
//              delegate: new SliverChildBuilderDelegate(
//                      (BuildContext context, int index) {
//                    //创建列表项
//                    return new Container(
//                      alignment: Alignment.center,
//                      color: Colors.lightBlue[100 * (index % 9)],
//                      child: new Text('list item $index'),
//                    );
//                  },
//                  childCount: 50 ,//50个列表项
//
//              ),
//            ),
//          ],
//        ),
//
//
//
//
//
//
//      )
//    );
//  }
//}


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

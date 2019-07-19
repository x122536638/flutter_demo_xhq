import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String icons = "";
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";

    icons += 'sdsdsds';

    Text t1 = Text(
      icons,
      style: TextStyle(
          fontFamily: "MaterialIcons", fontSize: 24.0, color: Colors.green),
    );

    CupertinoSwitch switch1 = new CupertinoSwitch(
      value: true,
      onChanged: (v) {},
    );


    //textfiled contrroller
    TextEditingController _textContrlloer = TextEditingController();

//    print(_textContrlloer.text);
    _textContrlloer.addListener((){
      print(_textContrlloer.text);
    });

    print('11111');
      return new MaterialApp(
      title: 'Welcome to Flutter',
      home: //new Echo(text: 'ddddd',backgroundColor: Colors.red,),
//      new FirstPage(),
          new Scaffold(
        body: Column(
          children: <Widget>[
//            FlatButton(
//              color: Colors.blue,
//              highlightColor: Colors.blue[700],
//              colorBrightness: Brightness.dark,
//              splashColor: Colors.grey,
//              child: Text("Submit"),
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(20.0)),
//              onPressed: () => {},
//            ),
//            Image(
//              image: NetworkImage(
//                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
//              width: 100.0,
//            ),



            new FocusTestRoute(),
          ],
        ),
      ),

//      new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter'),
//        ),
//        body: new Center(
////          child: new Text('Hello World'),
//          child: new RaisedButton(
//            onPressed: () {
//              print('ddd');
//
////              Navigator.push(context, new MaterialPageRoute(builder: (context) {
////                return new NewRoute();
////              }));
//              Navigator.of(context).push(
//                  new MaterialPageRoute(builder: (context) {
//                    return new NewRoute();
//                  }));
//            },
//          ),
//        ),
//      ),
    );
  }
}


class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => new _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            focusNode: focusNode1,//关联focusNode1
            decoration: InputDecoration(
                labelText: "input1"
            ),
          ),
      Container(
        child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: "Email",
                hintText: "电子邮件地址",
                prefixIcon: Icon(Icons.email),
                border: InputBorder.none //隐藏下划线
            )
        ),
        decoration: BoxDecoration(
          // 下滑线浅灰色，宽度1像素
            border: Border(bottom: BorderSide(color: Colors.grey[200], width: 1.0))
        ),
      ),

          TextField(
            focusNode: focusNode2,//关联focusNode2
            decoration: InputDecoration(
                labelText: "input2",
              border: InputBorder.none,
            ),
          ),

          Container(
            padding: EdgeInsets.only(left: 150),
            height: 1,
//            width: 200,
            color: Colors.red,
          ),
          Builder(builder: (ctx) {
            return Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("移动焦点"),
                  onPressed: () {
                    //将焦点从第一个TextField移到第二个TextField
                    // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                    // 这是第二种写法
                    if(null == focusScopeNode){
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(focusNode2);
                  },
                ),
                RaisedButton(
                  child: Text("隐藏键盘"),
                  onPressed: () {
                    // 当所有编辑框都失去焦点时键盘就会收起
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                ),
              ],
            );
          },
          ),
        ],
      ),
    );
  }

}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page1"),
      ),
      body: Center(
        child: FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  fullscreenDialog: true, builder: (context) => NewRoute()));
            },
            child: Text(
              '跳转',
              style: TextStyle(height: 2.5, fontSize: 18),
              textScaleFactor: 1.9,
            )),
      ),
    );
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

class Echo extends StatelessWidget {
  const Echo({
    Key key,
    @required this.text,
    this.backgroundColor: Colors.grey,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() =>
      new _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSelected, //当前状态
          onChanged: (value) {
            //重新构建页面
            setState(() {
              _switchSelected = value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red, //选中时的颜色
          onChanged: (value) {
            setState(() {
              _checkboxSelected = value;
            });
          },
        )
      ],
    );
  }
}

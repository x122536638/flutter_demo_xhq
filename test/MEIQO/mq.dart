import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'MQInternationalization.dart';
import 'MainPage.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(new MyApp());
}

// Locale localeQJ = Locale('zh', 'CN');

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // 供外部使用的_AppSetting实例，用于修改app的状态

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      localizationsDelegates: [
        // 本地化的代理类
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DemoLocalizationsDelegate.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // 美国英语
        const Locale('zh', 'CN'), // 中文简体
        //其它Locales
      ],
      locale: const Locale('en', 'US'),
//      locale: const Locale('zh', 'CN'),

//      title: DemoLocalizations.of(context).titleBarTitle,//'Welcome to Flutter',
      home: XHQLocalizations(
        child: XHQSTFW(),
        key: globalKey,
      ),

//      XHQSTFW(),

//      new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter'),
//        ),
//        body: new Center(
//          child: new Text('Hello World'),
//        ),
//      ),
    );
  }
}

//class MyApp extends StatelessWidget {
//
//
//}

class XHQSTFW extends StatefulWidget {
  //是否显示欢迎页


  @override
  _XHQSTFWState createState() => _XHQSTFWState();
}

class _XHQSTFWState extends State<XHQSTFW> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: //primaryColor   primarySwatch
          ThemeData(
        primaryColor: Color(0xffFFD54F),
      ), //Colors.yellow[600] type 'Color' is not a subtype of type 'MaterialColor'
//      iconTheme: IconThemeData(color: Colors.teal),
      child: new Scaffold(
        appBar: new AppBar(
          leading: Icon(Icons.star),
          title: Text(DemoLocalizations.of(context).titleBarTitle),

//          new Text('Welcome to meiqo.'),
        ),
        body: Center(
          child: MqWelcome(),
        ),
      ),
    );
  }
}

//国际化全局key

GlobalKey<_XHQLocalizationsState> globalKey =
    new GlobalKey<_XHQLocalizationsState>();

//国际化widget

class XHQLocalizations extends StatefulWidget {
  final Widget child;

  XHQLocalizations({Key key, this.child}) : super(key: key);

  @override
  _XHQLocalizationsState createState() => _XHQLocalizationsState();
}

class _XHQLocalizationsState extends State<XHQLocalizations> {
  Locale locale = Locale('en');

  changeLocal(Locale l) {
    setState(() {
      locale = l;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      child: widget.child,
      locale: locale,
    );
  }
}

class MqWelcome extends StatefulWidget {
  @override
  _MqWelcomeState createState() => _MqWelcomeState();
}

class _MqWelcomeState extends State<MqWelcome> {
  final myController = TextEditingController();
  final myController2 = TextEditingController(text:globalKey.currentState.locale.languageCode );

  TextFormField textField0;
  TextFormField textField01; /*没用 用controller获取text*/

//如果想拿到TF1的文本  ,ios 做法 是成员变量指向TF1 flutter 好像不好使 用sting类型属性记录住 TF1内容

  _start() {
    //拿到textfrom?
//    textField01.text;/* 鸭羹没有这个属性啊 */

//      print(textField01.controller.text);

    print(myController.text);

//    Navigator.removeRoute(context, route)
    Navigator.pop(context, 'Nope!');
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new MainPage()));
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    tf0.controller.text = globalKey.currentState.locale.languageCode;

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Widget w1() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Icon(Icons.label),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('ddadadadsadadadaads'),
              Text(DemoLocalizations.of(context).clickTop),
            ],
          ),
        ),
      ],
    );
  }

  TextFormField get tf1 => textField01 = TextFormField(
        controller: myController,
        decoration: InputDecoration(
          labelText: "zip",
          hintText: "请输入zip",
//            prefixIcon: Icon(Icons.email),
//            border: InputBorder.none //隐藏下划线
        ),
        autovalidate: true,
        validator: (v) {
          return v.trim().length > 5 ? null : "不能为小于5";
        },
      );

  Widget get tf2 {
    return FlatButton(
      //因为按钮默认有内边距
      padding: EdgeInsets.all(0),
      onPressed: () {
        print('按钮点击了');
//        tf0.controller.text = 'ss';//问题 这个字符怎么动态改变
//        tf0.controller.text = globalKey.currentState.locale.languageCode;

        showAlertDialog(context);
      },
      child: Row(
        children: <Widget>[
          Spacer(
            flex: 30,
          ),
          Expanded(
            flex: 40,
            child: Container(
              margin: EdgeInsets.only(top: 30),
              color: Colors.black38,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: tf0,
                  ),
                  Expanded(flex: 2, child: Icon(Icons.arrow_drop_down)),
                ],
              ),
            ),
          ),
          Spacer(
            flex: 30,
          ),
        ],
      ),
    );
  }

  TextFormField get tf0 {
    return textField0 = TextFormField(
      enabled: false,
      controller: myController2,
      decoration: InputDecoration(
          labelText: "选择语言",
//          hintText: globalKey.currentState.locale.languageCode,

          border: InputBorder.none //隐藏下划线
          ),
    );
  }
//      TextFormField(
//    controller: myController2,
//    decoration: InputDecoration(
//      labelText: "选择语言",
////      hintText: "请输入zip",
////            prefixIcon: Icon(Icons.email),
//            border: InputBorder.none //隐藏下划线
//    ),
////    autovalidate: true,
////    validator: (v) {
////      return v.trim().length > 5 ? null : "不能为小于5";
////    },
//
//  );

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Colors.black38),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              "everyThingdadsasdeveryThingdadsasdeveryThingdadsasd",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Text("everyThing .......dadsasd"),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                w1(),
//            tf1(),
//          Container(margin: EdgeInsets.only(top: 50),color: Colors.black12,width: 200,child: tf1(),),
                tf2,
//            Text('hhh'),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    children: <Widget>[
                      Spacer(
                        flex: 30,
                      ),
                      Expanded(
                        child: Container(
                          child: tf1,
                          color: Colors.black38,
                        ),
                        flex: 40,
                      ),
                      Spacer(
                        flex: 30,
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: FlatButton(
                    child: Text("START"),
                    onPressed: _start,
                  ),
                  alignment: Alignment.centerRight,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Locale _locale = const Locale('zh', 'CH');

                  Locale localeOf = Localizations.localeOf(context);
                  print(localeOf);
                  //应该在这儿设置 语言为中文 ,但是 怎么设置呢
//               freeLocalizationStateKey.currentState.changeLocale(const Locale('zh',"CH"));
//               Localizations.localeOf(context) =  Locale('zh', 'CN');

                  globalKey.currentState.changeLocal(Locale('zh'));
                  Navigator.of(context).pop();
                },
                child: Text('中文'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  globalKey.currentState.changeLocal(Locale('en'));
                  Navigator.of(context).pop();
                },
                child: Text('English'),
              ),
            ],
          );
        });
  }
}

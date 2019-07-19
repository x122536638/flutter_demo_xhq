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
    _textContrlloer.addListener(() {
      print(_textContrlloer.text);
    });

    print('11111');
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: //new Echo(text: 'ddddd',backgroundColor: Colors.red,),
//      new FirstPage(),
          new FormTestRoute(),
    );

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
//    );
  }
}

class FormTestRoute extends StatefulWidget {
  @override
  _FormTestRouteState createState() => new _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("form"),
      ),
      body: new Container(
        color: Colors.amberAccent,
        width: 300.0,
        height: 300.0,

        child:
//        new FittedBox(
////          fit: BoxFit.fitWidth,
////          alignment: Alignment.topLeft,
//          child: new Container(
//            color: Colors.red,
//            child: new Text("FittedBox"),
//          )
//          ,
//        ),
        new Image.asset('images/11.png',fit: BoxFit.fitWidth),
      )

//      Padding(
//        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
//        child: Form(
//            autovalidate: true,
//            key: _formKey,
//            child: Column(
//              children: <Widget>[
//                TextFormField(
//                  decoration: InputDecoration(
//                    labelText: "yonghuming",
//                    icon: Icon(Icons.person),
//                  ),
//                  validator: (String t) {
//                    return t.trim().length > 0 ? null : '用户名不能为空';
//                  },
////              controller: _unameController,
//                ),
//                TextFormField(
//                  decoration: InputDecoration(
//                    icon: Icon(Icons.lock),
//                    labelText: "密码",
//                  ),
//                  validator: (v) {
//                    return v.length > 5 ? null : "密码至少6位数";
//                  },
//                  obscureText: true,
//                ),
//                Padding(
//                  padding: EdgeInsets.only(top: 28),
//                  child: Row(
//                    children: <Widget>[
//                      Expanded(
//                        child: RaisedButton(
//                          child: Text("登录"),
//                          onPressed: () {
//                            if ((_formKey.currentState as FormState)
//                                .validate()) {
//                              print('验证通过');
//                            }
//                          },
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ],
//            )),
//      ),
    );
  }
}

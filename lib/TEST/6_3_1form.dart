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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("form"),
      ),
      body:
          Padding(padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),child: Form(child: Column(

            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "yonghuming",
                  icon: Icon(Icons.person),
                ),
                validator:(String t){
                  return t.trim().length>0?null:'用户名不能为空';
                },


              ),

            ],




          )),),
    );
  }
}

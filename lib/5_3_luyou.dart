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

    icons+='sdsdsds';

    Text t1= Text(icons,
      style: TextStyle(
          fontFamily: "MaterialIcons",
          fontSize: 24.0,
          color: Colors.green
      ),
    );


    return new MaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      title: 'Welcome to Flutter',
      home: //new Echo(text: 'ddddd',backgroundColor: Colors.red,),
      new Builder(builder: (BuildContext context){
        return FirstPage();
      }),

//      FirstPage(),
//        new Scaffold(
//          body:        Column(
//            children: <Widget>[
//
//              FlatButton(
//                color: Colors.blue,
//                highlightColor: Colors.blue[700],
//                colorBrightness: Brightness.dark,
//                splashColor: Colors.grey,
//                child: Text("Submit"),
//                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//                onPressed: () => {},
//              ),
//              Image(
//                image: NetworkImage(
//                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
//                width: 100.0,
//              ),
//              t1,
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Icon(Icons.accessible,color: Colors.green,),
//                  Icon(Icons.error,color: Colors.green,),
//                  Icon(Icons.fingerprint,color: Colors.green,),
//                ],
//              ),
//
//
//            ],
//          ),
//
//        ),



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
              Navigator.of(context).push(
                  MaterialPageRoute(fullscreenDialog: true,builder: (context) => NewRoute()));
            },
            child: Text('跳转',style: TextStyle(height: 2.5,fontSize: 18),textScaleFactor: 1.9,)),
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
    this.backgroundColor:Colors.grey,
  }):super(key:key);

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

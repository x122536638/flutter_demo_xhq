import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
//  debugPaintSizeEnabled =true;
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home:ScrollControllerTestRoute(),
    );
  }
}



class ScrollControllerTestRoute extends StatefulWidget {
  @override
  ScrollControllerTestRouteState createState() {
    return new ScrollControllerTestRouteState();
  }
}

class ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
  ScrollController _controller= ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener((){


      print(_controller.offset);
    if(_controller.offset <300 && showToTopBtn ==true){


      setState(() {
        showToTopBtn =false;
      });
    }else if(_controller.offset >300 && showToTopBtn ==false){

      setState(() {
        showToTopBtn =true;
      });
    }


    });
  }


  @override
  void dispose() {
    // TODO: implement _
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Welcome to Flutter'),
      ),
      body: new Center(
        child: new ListView.builder(
//
        itemCount: 50,
        itemExtent: 50,
        itemBuilder:(BuildContext context, int index){
          return ListTile(title: Text('$index'),);
        },
        controller: _controller,


      ),
      ),
      floatingActionButton: !showToTopBtn?null: FloatingActionButton(
        onPressed: (){
          _controller.animateTo(0, duration: Duration(milliseconds: 201),curve:Curves.ease );
        },
         child: Icon(Icons.vertical_align_top),
      ),
    );


//      Scrollbar(
//
//      child: new ListView.builder(
//
//        itemCount: 50,
//        itemExtent: 50,
//        itemBuilder:(BuildContext context, int index){
//          return ListTile(title: Text('$index'),);
//        },
//        controller: _controller,
//
//
//      ),
//    );
  }

}
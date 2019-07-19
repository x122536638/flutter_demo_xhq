import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Student Info",
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[StudentScreenAppBar(), StudentGraduateList()],
      ),
    );
  }
}

class StudentScreenAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 20.0,
              ),
              onPressed: () {}),
          centerTitle: true,
          title: Text(
            "Student Info",
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.settings,
                  size: 20.0,
                  color: Colors.black,
                ),
                onPressed: () {}),
//        SizedBox(width: 10.0,),
            IconButton(
                icon: Icon(
                  Icons.settings_ethernet,
                  color: Colors.black,
                  size: 20.0,
                ),
                onPressed: () {})
          ],
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
            child: Image.asset(
              "images/isdi_school.png",
              width: 40.0,
              height: 15.0,
              fit: BoxFit.contain,
            ))
      ],
    );
  }
}

class StudentGraduateList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(child: yearListForUgPg("Under Graduate")),
          Expanded(child: yearListForUgPg("Post Graduate"))
        ],
      ),
    );
  }

  Widget yearListForUgPg(String graduationName) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(25.0, 4.0, 25.0, 4.0),
          child: Text(
            graduationName,
            style:
            TextStyle(color: Colors.white, fontFamily: "suisseintlMedium"),
          ),
          decoration: BoxDecoration(color: Colors.black),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "2018",
                  style: TextStyle(
                      fontFamily: "okomitoBold", color: Colors.black),
                ),
                Icon(Icons.arrow_forward)
              ],
            );
          },
          itemCount: 10,
        )
      ],
    );
  }
}
import 'dart:math';
class Musician extends Performer with Musical {
  // ...
}

class Performer {
}



abstract class Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}


class Maestro extends Musical
    with Person, Aggressive, Demented {//ext和with的类方法冲突 with的优先级更高
  Maestro(String maestroName) {
    name = maestroName;
    canConduct = true;
  }
}

class Demented {


}

class Person {
  String name;
  sleep(){
    print("我去睡觉了");
  }

  entertainMe(){
    print("冲突方法");
  }
}

class Aggressive {
}

main2(){

  Maestro('bjs')
  ..entertainMe()
  ..sleep();


}



class Point {
  num x;
  num y;
  Point(this.x, this.y);

 static num  distanceBetween(Point a,Point b){
   var dx = a.x - b.x;
   var dy = a.y - b.y;
   return sqrt(dx * dx + dy * dy);
 }
}

main() {
  var a = new Point(2, 2);
  var b = new Point(4, 4);
  var distance = Point.distanceBetween(a, b);
  assert(distance < 2.9 && distance > 2.8);

  A(name: "jack");
//  B("rose");
  print(B(name1:'rose').name);

}

class A{
  String name;

//  A(this.name);
A({String name}){
  this.name = name;
}
//A(this.name);
}

class B extends A{

  B({String name1}) : super(name:name1);

//  B():super();
}
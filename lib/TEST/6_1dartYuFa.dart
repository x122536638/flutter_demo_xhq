class Point {
  num x;
  num y;

//  Point(this.x, this.y);

  Point(num x, num y) {
    print('point  gouzao hanshu ');
    this.x = x;
    this.y = y;
  }

  // Initializer list sets instance variables before
  // the constructor body runs.
  Point.fromJson(Map jsonMap)
      : x = jsonMap['x'],
        y = jsonMap['y'] {
    print('In Point.fromJson(): ($x, $y)');
  }

  //重定向
  Point.alongXAxis(num x) : this(x, 0);
}

class ImmutabelePoint {
  final num x;
  final num y;

  ImmutabelePoint(this.x, this.y);

  static final ImmutabelePoint orign = ImmutabelePoint(0, 0);
}

//class Person {
//  String firstName;
//
//  Person.fromJson(Map data) {
//    print('in Person');
//  }
//}
//
//class Employee extends Person {
//
//  static findXXX(){
//    return {};
//  }
//  // Person does not have a default constructor;
//  // you must call super.fromJson(data).
//  Employee.fromJson(Map data) : super.fromJson(data) {
//    print('in Employee');
//  }
//
//  Employee() : super.fromJson(findXXX());
//
//
//
//}

class AAA {
  say({String who, String what}) {
    print('$who say $what');
  }

  enableFlags({bool bold, bool hidden}) {
    // ...
  }
}

//class Symbol {
//  final String name;
//  static Map<String, Symbol> _cache = new Map<String, Symbol>();
//
//  factory Symbol(String name) {
//    if (_cache.containsKey(name)) {
//      return _cache[name];
//    } else {
//      final symbol = new Symbol._internal(name);
//      _cache[name] = symbol;
//      return symbol;
//    }
//  }
//
//  Symbol._internal(this.name);
//}

class Logger {
  final String name;
  bool mute = false;
  static final Map<String, Logger> _cache = <String, Logger>{};

//  Logger(this.name,this.mute);//这个函数直接报错
  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      print('工厂方法');
      final logger = new Logger._internal(name);
      _cache[name] = logger;
      return logger;
//    return Logger._internal(name);
    }
  }

  Logger._internal(this.name);
//问题 构造函数没有创建  如果创建带2个参数的 构造函数 再用类名+函数名+参数 重定向到构造函数
//解决 :使用命名构造函数可以为一个类实现多个构造函数， 或者使用命名构造函数来更清晰的表明你的意图：

//  Logger(this.name,this.mute);//这个函数直接报错//如果把工厂函数注释掉就不会报错了!

}


class ANM{
  live(){
    print('$runtimeType LIVE');
  }
}

class Bird {
  fly() {
    print("bird fly");
  }
}

class Person {
  // In the interface, but visible only in this library.
  final _name;

  // Not in the interface, since this is a constructor.
  Person(this._name);

  // In the interface.
  String greet(who) => 'Hello, $who. I am $_name.';

  say() {
    print("Person  say");
  }
}
@proxy
// An implementation of the Person interface.
class Imposter extends ANM implements  Person, Bird {
  // We have to define this, but we don't use it.
//  final _name = "";

  String greet(dynamic who) => 'Hi $who. Do you know who I am?';

  @override
  // TODO: implement _name
//  get _name => null;



  Imposter();

  @override
  say() {
    print('nm');
  }

  @override
  fly() {
    // TODO: implement fly
    print("ssss fly");
    return null;
  }


  @override
  live() {
    // TODO: implement live
    print('Imposter live');
     super.live();
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

greetBob(Person person) => person.greet('bob');


enum Color {
  red,
  green,
  blue
}










main() {




//  Color aColor = Color.blue;
//  switch (aColor) {
//  case Color.red:
//  print('Red as roses!');
//  break;
//  case Color.green:
//  print('Green as grass!');
//  break;
//  default: // Without this, you see a WARNING.
//  print(aColor);  // 'Color.blue'
//  }
//  Imposter()
//    ..say()
//    ..fly()
//    ..live()
//  ;

//    new Logger('javk');

//      print(identical(Symbol('xxx'), Symbol("x")));
//  Point point = Point.fromJson({'x':6,"y":7});
//
//  print(point);

//  Employee.fromJson({});
//  ImmutabelePoint.orign;
//  print( ImmutabelePoint.orign.x);

//Employee();

//new Logger("UI");

//Logger('ui');

//Logger();

//Symbol('ddd');

//  AAA aaa = AAA();
//  aaa.say(who: 'jack',what: 'i love you');
//  aaa.say(who: 'rose');
//  print(aaa);

//  aaa.enableFlags(bold: )
}

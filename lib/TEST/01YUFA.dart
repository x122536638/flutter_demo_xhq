
import 'package:flutter/material.dart';

enableFlags({bool bold, bool hidden}){//{}不就相当于可选吗 ,为啥网站上说[]是可选参数

}


enableFlags1(bool bold, bool hidden){

}

enableFlags2({bold: true, hidden: false}){

}
//问题1
main1(){



  enableFlags(bold: true);
  enableFlags1(true, true);
  enableFlags2(hidden: true);

  say('1', '2','dev','phone');
}

String say(String from, String msg, [String device,String phone]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}
//-----------类名 +泛型   以cache2为例 ,就是为了 指定参数类型!

abstract class Cache<T> {
  T getByKey(String key);
  setByKey(String key, T value);
}



class CacheZiLei extends Cache<int>{
  @override
  int getByKey(String key) {
    // TODO: implement getByKey
    return null;
  }

  @override
  setByKey(String key, int value) {
    // TODO: implement setByKey
    return null;
  }
}

class CacheZiLei2 extends Cache<String>{
  @override
  String getByKey(String key) {
    // TODO: implement getByKey
    return null;
  }

  @override
  setByKey(String key, String value) {
    // TODO: implement setByKey
    return null;
  }

}


//泛型

//class Cache2<T> {
//  T getByKey(String key){
//  }
//  setByKey(String key, T value){
//  print(value.runtimeType);
//  }
//}
//
//main(){
//
//
//
//  CacheZiLei obj01 = CacheZiLei();
////  obj01.setByKey('key1', 'ss');//报错
//  obj01.setByKey('key1', 100);
//
//
//  Cache2 obj = Cache2<double>();
////  obj.setByKey('key1', 'sss');//会报错
//  obj.setByKey('key1', 0.1);
//
//
//  Cache2  obj2 =Cache2();
//  obj2.setByKey('ss', 'ss');
//}




//class FX<T>{
//
//  f1(T p1){
//    print(p1.runtimeType);
//  }
//
//}
//
//void main(){
//  FX<double> fx = FX<double>();
//  fx.f1('111');
//}



//abstract class A{
//  VoidCallback get f1;
//
//
//
//  void a_log(){
//    f1();
//  }
//
//}
//
//class A2 extends A{
//
//
//  void fun1(){
//    print('A2 FUN1');
//  }
//
//
//  @override
//  // TODO: implement f1
//  VoidCallback get f1 {
//    return fun1;
//  }
//
//}
//
//
//void main(){
//
//
//
//  A2()
//      ..a_log();
//}



abstract class A{
  VoidCallback  f1;
  int  age;




  void a_log(){
    f1();
  }

  A(this.f1,this.age);


}

class A2 extends A{


  void fun1(){
    print('A2 FUN1');
  }

  A2(f1,age):super(f1,age);//子类赋值给父类的属性



}


void main(){

  void fun1(){
    print('main FUN1');
  }

  A2(fun1,5)
    ..a_log();
  print('end');
}
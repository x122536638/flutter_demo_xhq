import 'dart:io';
void main() {
 
  
  
  Future.delayed(new Duration(seconds: 2),(){
    return "hello";


  // ignore: unnecessary_statements
  }).then((str){
    print(str);
  });



  
}

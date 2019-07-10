


enableFlags({bool bold, bool hidden}){//{}不就相当于可选吗 ,为啥网站上说[]是可选参数

}


enableFlags1(bool bold, bool hidden){

}

enableFlags2({bold: true, hidden: false}){

}

main(){



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
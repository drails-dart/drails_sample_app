import 'package:polymer/polymer.dart';
import 'dart:html';

main() {
  var href = window.location.href;
  if(!href.contains('localhost:808'))
    initPolymer();
  else
    window.location.href = href.replaceFirst('808', '404');
}

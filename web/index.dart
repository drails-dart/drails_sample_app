import 'package:polymer/polymer.dart';
import 'dart:html';

main() {
  var href = window.location.href;
  if(href.contains('4040'))
    initPolymer();
  else
    window.location.href = href.replaceFirst('808', '404');
}

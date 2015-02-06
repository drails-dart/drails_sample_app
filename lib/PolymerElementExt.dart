import 'package:polymer/polymer.dart';
import 'package:polymer_expressions/filter.dart';
import 'package:sprintf/sprintf.dart' as SPRINTF;


class PolymerElementExt extends PolymerElement {
  PolymerElementExt.created() : super.created();

  String sprintf(String fmt, var args) =>
      SPRINTF.sprintf(fmt, args);
  
  final asInt = new _AsInt();
  
  final asDate = new _AsDate();
  
  String asSlashedDate(DateTime v) =>
      v == null ? '' : sprintf('%02d/%02d/%04d', [v.month, v.day, v.year]);
}

class _AsInt extends Transformer<String, int> {
  String forward(int i) => '$i';
  int reverse(String s) => 
      s == null || s.isEmpty ? 0 : int.parse(s);
}

class _AsDate extends Transformer<String, DateTime> {
  
  @override
  String forward(DateTime v) {
    if(v == null)
      v = new DateTime.now();
    return SPRINTF.sprintf('%04d-%02d-%02d', [v.year, v.month, v.day]);
  }

  @override
  DateTime reverse(String t) =>
      t == null || t.isEmpty ? new DateTime.now() : DateTime.parse(t);
}

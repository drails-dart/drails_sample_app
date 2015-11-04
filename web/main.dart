//export "package:polymer/init.dart";
import 'package:dson/dson.dart';
import 'dart:async';
import 'package:polymer/polymer.dart';
import 'package:drails_sample_app/models/models.dart';

/// Returns a [Future<Zone>] that code should be executed in for dirty checking.
/// The returned future will complete once polymer is ready and all @initMethod
/// and @whenPolymerReady functions have been executed.
Future<Zone> main() {
  print(toJson(new Person()..firstName = 'luis'));
  return initPolymer().then((zone) => Polymer.onReady.then((_) => zone));
}

// Copyright (c) 2015, Luis Vargas. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:polymer/polymer.dart';
import 'package:drails_sample_app/models/models.dart';
import 'dart:html';
import 'package:drails_sample_app/PolymerElementExt.dart';

/// A Polymer `<sample-employees>` element.
@CustomTag('sample-employees-element')
class SampleEmployeesElement extends PolymerElementExt {
  /// Constructor used to create instance of MainApp.
  SampleEmployeesElement.created() : super.created();

  @published Employee employee;
  @published User user;
  
  @observable bool editing = false;
  
  editEmployee(Event e, detail, Element target) {
    editing = true;
  }
  
  deleteEmployee(Event e, detail, Element target) {
    fire('delete-employee', detail: employee);
  }
}
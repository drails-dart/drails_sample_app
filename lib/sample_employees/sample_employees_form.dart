// Copyright (c) 2015, Luis Vargas. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:polymer/polymer.dart';
import 'package:drails_sample_app/models.dart';
import 'dart:html';
import 'package:dson/dson.dart';
import 'package:drails_sample_app/PolymerElementExt.dart';

/// A Polymer `<sample-employees>` element.
@CustomTag('sample-employees-form')
class SampleEmployeesForm extends PolymerElementExt {
  /// Constructor used to create instance of MainApp.
  SampleEmployeesForm.created() : super.created();

  @published Employee employee;
  @published bool editing;
  @observable Employee employeeAux;

  ready() {
    employeeAux = new Employee();
    if(employee != null)
      employeeAux
          ..id = employee.id
          ..firstName = employee.firstName
          ..lastName = employee.lastName
          ..dob = employee.dob;
    else
      employeeAux.dob = new DateTime.now();
  }
  
  void cancelEditing(Event e, detail, Element target) {
    editing = false;
  }
  
  void saveEmployee(Event e, detail, Element target) {
    HttpRequest.request('employees', method: 'POST', sendData: serialize(employeeAux)).then((request) {
      fire('employee-saved', detail: deserialize(request.response, Employee));
      editing = false;
    });
  }
}

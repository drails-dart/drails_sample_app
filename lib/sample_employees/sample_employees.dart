// Copyright (c) 2015, Luis Vargas. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:polymer/polymer.dart';
import 'package:drails_sample_app/models/models.dart';
import 'dart:html';
import 'package:dson/dson.dart';

/// A Polymer `<sample-employees>` element.
@CustomTag('sample-employees')
class SampleEmployees extends PolymerElement {
  /// Constructor used to create instance of MainApp.
  SampleEmployees.created() : super.created();

  @published User user;
  
  @observable ObservableList<Employee> employees;
  
  @observable Employee newEmployee;
  
  @observable bool adding;
  
  ready() {
    HttpRequest.getString('employees').then((response) {
      employees = toObservable(fromJsonList(response, Employee));
    }, onError: (ProgressEvent e) {
      if((e.target as HttpRequest).status == 401)
        window.dispatchEvent(new CustomEvent('show-login'));
    });
  }
  
  deleteEmployee(Event e, Employee p, Element target) {
    HttpRequest.request('employees/${p.id}', method: 'DELETE').then((response) {
      employees.remove(p);
    });
  }
  
  saveEmployee(Event e, Employee p, Element target) {
    var p1 = employees.firstWhere((e) => e.id == p.id);
    employees[employees.indexOf(p1)] = p;
  }
  
  beginAddingEmployee() => adding = true;
  
  addingChanged(old) {
    print(old);
    if(adding) {
      scrollTop = scrollHeight;
    }
  }
  
  addEmployee(Event e, Employee p, Element target) => employees.add(p);
}

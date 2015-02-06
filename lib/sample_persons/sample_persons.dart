// Copyright (c) 2015, Luis Vargas. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:polymer/polymer.dart';
import 'package:drails_sample_app/models.dart';
import 'dart:html';
import 'package:dson/dson.dart';

/// A Polymer `<sample-persons>` element.
@CustomTag('sample-persons')
class SamplePersons extends PolymerElement {
  /// Constructor used to create instance of MainApp.
  SamplePersons.created() : super.created();

  @observable ObservableList<Person> persons;
  
  @observable Person newPerson;
  
  @observable bool adding;
  
  ready() {
    HttpRequest.getString('http://localhost:4040/persons').then((response) {
      persons = toObservable(deserializeList(response, Person));
    });
  }
  
  deletePerson(Event e, Person p, Element target) {
    HttpRequest.request('http://localhost:4040/persons/${p.id}', method: 'DELETE').then((response) {
      persons.remove(p);
    });
  }
  
  savePerson(Event e, Person p, Element target) {
    var p1 = persons.firstWhere((e) => e.id == p.id);
    persons[persons.indexOf(p1)] = p;
  }
  
  beginAddingPerson() => adding = true;
  
  addPerson(Event e, Person p, Element target) => persons.add(p);
}

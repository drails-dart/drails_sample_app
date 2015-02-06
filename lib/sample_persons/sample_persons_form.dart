// Copyright (c) 2015, Luis Vargas. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:polymer/polymer.dart';
import 'package:drails_sample_app/models.dart';
import 'dart:html';
import 'package:dson/dson.dart';
import 'package:drails_sample_app/PolymerElementExt.dart';

/// A Polymer `<sample-persons>` element.
@CustomTag('sample-persons-form')
class SamplePersonsForm extends PolymerElementExt {
  /// Constructor used to create instance of MainApp.
  SamplePersonsForm.created() : super.created();

  @published Person person;
  @published bool editing;
  @observable Person personAux;

  ready() {
    personAux = new Person();
    if(person != null)
      personAux
          ..id = person.id
          ..firstName = person.firstName
          ..lastName = person.lastName
          ..dob = person.dob;
    else
      personAux.dob = new DateTime.now();
  }
  
  void cancelEditing(Event e, detail, Element target) {
    editing = false;
  }
  
  void savePerson(Event e, detail, Element target) {
    HttpRequest.request('http://localhost:4040/persons', method: 'POST', sendData: serialize(personAux)).then((request) {
      fire('person-saved', detail: deserialize(request.response, Person));
      editing = false;
    });
  }
}

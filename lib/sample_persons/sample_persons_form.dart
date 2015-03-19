// Copyright (c) 2015, Luis Vargas. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:polymer/polymer.dart';
import 'package:drails_sample_app/models/models.dart';
import 'dart:html';
import 'package:dson/dson.dart';
import 'package:drails_sample_app/PolymerElementExt.dart';
import 'package:paper_elements/paper_input.dart';

/// A Polymer `<sample-persons-form>` element.
@CustomTag('sample-persons-form')
class SamplePersonsForm extends PolymerElementExt {
  /// Constructor used to create instance of SamplePersonsForm.
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
  
  editingChanged(old) {
    if(editing) fire('begin-editing', detail: getBoundingClientRect().top);
  }
  
  void savePerson(Event e, detail, Element target) {
    HttpRequest.request('persons', method: 'POST', sendData: serialize(personAux)).then((request) {
      fire('person-saved', detail: deserialize(request.response, Person));
      editing = false;
    });
  }
}

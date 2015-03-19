// Copyright (c) 2015, Luis Vargas. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:polymer/polymer.dart';
import 'package:drails_sample_app/models/models.dart';
import 'dart:html';
import 'package:drails_sample_app/PolymerElementExt.dart';

/// A Polymer `<sample-persons>` element.
@CustomTag('sample-persons-element')
class SamplePersonElement extends PolymerElementExt {
  /// Constructor used to create instance of MainApp.
  SamplePersonElement.created() : super.created();

  @published Person person;
  
  @observable bool editing = false;
  
  editPerson(Event e, detail, Element target) {
    editing = true;
  }
  
  deletePerson(Event e, detail, Element target) {
    fire('delete-person', detail: person);
  }
}
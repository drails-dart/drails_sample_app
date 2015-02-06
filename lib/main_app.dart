// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:polymer/polymer.dart';
import 'package:drails_sample_app/models.dart';
import 'dart:html';
import 'package:dson/dson.dart';

/// A Polymer `<main-app>` element.
@CustomTag('main-app')
class MainApp extends PolymerElement {
  
  @observable User user;

  /// Constructor used to create instance of MainApp.
  MainApp.created() : super.created();
  
  ready() {
    var usrStr = window.sessionStorage['user'];
    if(usrStr != null)
      user = deserialize(usrStr, User);
    else
      user = new User();
  }
  
  login(Event e, details, Element target) {
    HttpRequest.request("login", method: 'POST', sendData: serialize(user)).then((request) {
      window.sessionStorage['user'] = request.response;
      user = deserialize(request.response, User);
    });
  }
  
  logout(Event e, details, Element target) {
    HttpRequest.request("logout", method: 'GET').then((req) {
      user = new User();
      $['core_menu'].selected = 0;
      window.sessionStorage.clear();
    });
  }
}

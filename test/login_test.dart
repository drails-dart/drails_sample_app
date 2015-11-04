// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library drails_sample_app_test;

import 'package:unittest/unittest.dart';
import '../bin/server.dart' as server;
import 'package:http/http.dart';
import 'package:drails/drails.dart' hide POST;

void main() => loginTests();

void loginTests() {
  server.main();

  var localhostUrl = 'http://127.0.0.1:4040',
      loginUrl = localhostUrl + '/login';
  
  group('login ->', () {
    test('no username and password', () {
      post(loginUrl).then(expectAsync((Response response) {
        expect(response.statusCode, 400);
      }));
    });
    test('bad username and password', () {
      post(loginUrl, body:'{"name": "lulo",  "password": "lulo"}').then(expectAsync((Response response) {
        expect(response.statusCode, 400);
      }));
    });
    test('correct', () {
      post(loginUrl, body:'{"name": "jhon",  "password": "jhon"}').then(expectAsync((Response response) {
        expect(response.statusCode, 200);
        expect(response.headers['set-cookie'], contains('DARTSESSID'));
        expect(response.body, '{"id":1,"name":"jhon","roles":["ADMIN"]}');
      }));
    });

    //stops the server after next test
    tearDown(() => DRAILS_SERVER.close());
    test('end', () {});
  });
}

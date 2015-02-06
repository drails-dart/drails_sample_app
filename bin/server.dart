library drails_example;

import 'package:drails/drails.dart';
import 'package:logging/logging.dart';
import 'dart:io';
import 'package:drails_sample_app/models.dart';

part 'controllers/persons_controller.dart';
part 'controllers/employee_controller.dart';
part 'data/persons_data.dart';


initLogger() {
  Logger.root.level = Level.OFF;
  hierarchicalLoggingEnabled = true;
  new Logger('server_init').level = Level.INFO;

  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

void main() {
  initLogger();

  ENV = 'prod';
  CLIENT_DIR['prod'] = '/../web/';

  POST['/login'] = (HttpSession session, @RequestBody User user) {
    var cu = g_users.values.singleWhere((u) => u.name == user.name && u.password == user.password);
    if(cu == null) throw Exception;
    session['user'] = cu;
    return new User()
        ..name = cu.name
        ..roles = cu.roles;
  };

  GET['/logout'] = (HttpSession session) {
    session['user'] = null;
  };
  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 4040 : int.parse(portEnv);

  print('portEnv: $portEnv');
  print('port: $port');

  initServer([#drails_example], port: port, address: new InternetAddress('0.0.0.0'));
}

//import 'dart:io' show Platform;
//import 'dart:async' show runZoned;
//import 'package:path/path.dart' show join, dirname;
//import 'package:shelf/shelf_io.dart' as io;
//import 'package:shelf_static/shelf_static.dart';
//
//void main() {
//  // Assumes the server lives in bin/ and that `pub build` ran
//  var pathToBuild = join(dirname(Platform.script.toFilePath()), '..', 'build/web');
//  
//  var handler = createStaticHandler(pathToBuild, defaultDocument: 'index.html');
//  
//  var portEnv = Platform.environment['PORT'];
//  var port = portEnv == null ? 9999 : int.parse(portEnv);
//  
//  runZoned(() {
//    io.serve(handler, '0.0.0.0', port);
//    print("Serving $pathToBuild on port $port");
//  }, onError: (e, stackTrace) => print('Oh noes! $e $stackTrace'));
//}

library drails_example;

import 'package:drails/drails.dart';
import 'package:drails_di/drails_di.dart';
import 'package:logging/logging.dart';
import 'dart:io';
import 'package:drails_sample_app/models/models.dart';
import 'package:dson/dson.dart';

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

//  ENV = 'prod';

  initServer(['drails_example']);
}

@Path('')
@injectable
class LoginController {

  @POST
  login(HttpSession session, @RequestBody User user) {
    var cu = g_users.values.singleWhere((u) => u.name == user.name && u.password == user.password);
    if(cu == null) throw Exception;
    session['user'] = cu;

    return toJson(cu, exclude: 'password');
  }

  @GET
  logout(HttpSession session) {
    session['user'] = null;
  }
}


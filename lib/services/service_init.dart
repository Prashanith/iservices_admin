import 'package:get_it/get_it.dart';
import 'package:iservices/controllers/controllers.dart';
import 'package:iservices/navigation/route_generator.dart';
import 'package:iservices/services/db_service.dart';

import 'api/requests.dart';

final locator = GetIt.instance;

class ServiceInitializer with ControllersMixin {
  static Future<void> initializeServices() async {
    locator.registerSingleton(db);
    locator.registerSingleton(RouteGenerator());
    locator.registerSingleton(RequestsService());
  }
}

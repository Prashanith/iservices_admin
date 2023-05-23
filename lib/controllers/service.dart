import 'package:get/get.dart';
import 'package:iservices/navigation/route_generator.dart';
import 'package:iservices/navigation/routes.dart';

import '../services/service_init.dart';

class ServiceController extends GetxController {
  final router = locator.get<RouteGenerator>();
  var _isServicesInitialized = false.obs;
  var i = 0.obs;

  void servicesInitialized() => _isServicesInitialized = RxBool(true);

  void postInitialization() {
    router.navigatorKey.currentState?.pushNamed(Routes.home);
  }
}

import 'package:get/get.dart';
import 'package:iservices/controllers/requests.dart';
import 'package:iservices/controllers/service.dart';

mixin ControllersMixin{
  RequestsController get requestsController => Get.put(RequestsController());
  ServiceController get serviceController => Get.put(ServiceController());

  void deleteControllers(){
    Get.deleteAll(force: true);
  }
}
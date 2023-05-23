import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:iservices/models/http_response.dart';
import 'package:iservices/services/api/requests.dart';
import '../services/service_init.dart';

class RequestsController extends GetxController {
  final requestsService = locator.get<RequestsService>();
  var isLoading = ValueNotifier(false);
  ValueNotifier<List<Request>> requests = ValueNotifier([]);

  @override
  void onInit() {
    getRequests();
    super.onInit();
  }

  Future<void> getRequests() async {
    isLoading.value = true;
    HttpResponse<JsonModel> response = (await requestsService.getRequests());
    if (response.data != null && response.error == null) {
      requests.value = [...requests.value, ...response.data];
    }
    isLoading.value = false;
  }

  Future<void> getPaginatedRequests() async {
    if (requests.value.isNotEmpty) {
      try {
        isLoading.value = true;
        HttpResponse<JsonModel> response =
            (await requestsService.getPaginatedRequests(
                requests.value[requests.value.length - 1].docSnap));
        if (response.data != null && response.error == null) {
          requests.value = [...requests.value, ...response.data];
        }
        isLoading.value = false;
      } catch (e) {
        print(e.toString());
      }
    }
  }
}

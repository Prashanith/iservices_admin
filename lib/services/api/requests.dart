import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iservices/config/db_config.dart';
import 'package:iservices/models/http_response.dart';
import 'package:iservices/services/service_init.dart';

class RequestsService {
  final db = locator.get<FirebaseFirestore>();

  Future<HttpResponse> getRequests() async {
    try {
      QuerySnapshot<Map<String, dynamic>> res =
          await db.collection(DBConfig.requestCollection).limit(10).get();
      return HttpResponse(
          data: List.generate(
              res.docs.length, (index) => Request(res.docs[index])),
          error: null);
    } catch (e) {
      return HttpResponse(data: null, error: Error(code: 500, message: ''));
    }
  }

  Future<HttpResponse> getPaginatedRequests(
      DocumentSnapshot documentSnapshot) async {
    try {
      QuerySnapshot<Map<String, dynamic>> res = await db
          .collection(DBConfig.requestCollection)
          .limit(10)
          .startAfterDocument(documentSnapshot)
          .get();
      Map<String, dynamic> response = {};
      response['error'] = null;
      response['data'] =
          List.generate(res.docs.length, (index) => Request(res.docs[index]));
      return HttpResponse.fromJson(response);
    } catch (e) {
      return HttpResponse(data: null, error: Error(code: 500, message: ''));
    }
  }
}

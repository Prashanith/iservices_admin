import 'package:cloud_firestore/cloud_firestore.dart';

class JsonModel<T> {
  DocumentSnapshot json;
  JsonModel(this.json);
}

class Request extends JsonModel {
  Request(DocumentSnapshot json) : super(json);

  String get id => json.id;
  String get name => json.get('name');
  String get email => json.get('email');
  String get mobile => json.get('mobile');
  bool get isDeclined => json.get('isDeclined') ?? false;
  DocumentSnapshot get docSnap => json;
}

class HttpResponse<T extends JsonModel> {
  HttpResponse({required this.data, required this.error});
  final dynamic data;
  final Error? error;

  bool get isValid => data != null && error == null;

  factory HttpResponse.fromJson(Map<String, dynamic> json) => HttpResponse(
      data: JsonModel<T>(json['data']),
      error:
          json['error'] == null ? null : Error.fromJson(json['error'] ?? {}));
}

class Error {
  Error({required this.code, required this.message});
  final int code;
  final String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
      code: json['code'] ? int.parse(json['code']) : 400,
      message: json['message'] ?? 'Unknown Error Occurred');
}

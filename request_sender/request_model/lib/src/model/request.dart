// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../request_model.dart';

enum RequestTypeE {
  GET(0),
  POST(1),
  PUT(2),
  DELETE(3),
  PATCH(4);

  const RequestTypeE(this.value);

  final int value;
}

extension RequestTypeEExt on RequestTypeE {
  String get name => map[this]!;
  static Map<RequestTypeE, String> get map => {
        RequestTypeE.GET: 'GET',
        RequestTypeE.POST: 'POST',
        RequestTypeE.PUT: 'PUT',
        RequestTypeE.DELETE: 'DELETE',
        RequestTypeE.PATCH: 'PATCH',
      };
  static Map<String, RequestTypeE> get reverseMap => {
        'GET': RequestTypeE.GET,
        'POST': RequestTypeE.POST,
        'PUT': RequestTypeE.PUT,
        'DELETE': RequestTypeE.DELETE,
        'PATCH': RequestTypeE.PATCH,
      };
  String toMap() => name;
  static RequestTypeE fromMap(String name) => reverseMap[name]!;
}

class RequestModel extends Equatable {
  final RequestTypeE type;
  final String url;
  final Map<String, String> headers;
  final dynamic body;
  final String? response;
  final bool isError;
  final String? stackTrace;
  RequestModel(
      {required this.type,
      required this.url,
      required this.headers,
      required this.isError,
      this.body,
      this.response,
      this.stackTrace});

  factory RequestModel.fromR(Request request) {
    Map<String, dynamic>? body;
    try {
      body = jsonDecode(request.body);
    } catch (e) {
      print('Cannot decode body');
    }
    return RequestModel(
      type: RequestTypeE.values[request.type.value],
      url: request.url,
      headers: request.headers,
      body: body,
      response: request.response,
      isError: request.isError,
      stackTrace: request.stackTrace,
    );
  }

  Request toR() {
    return Request(
      type: RequestType.values[type.index],
      url: url,
      headers: headers,
      body: body != null ? jsonEncode(body) : null,
      response: response,
      isError: isError,
      stackTrace: stackTrace,
    );
  }

  @override
  List<Object?> get props {
    return [
      type,
      url,
      headers,
      body,
      response,
      isError,
      stackTrace,
    ];
  }
}

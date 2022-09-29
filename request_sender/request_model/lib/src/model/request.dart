// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../request_model.dart';

enum RequestTypeE {
  GET,
  POST,
  PUT,
  DELETE,
  PATCH,
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
  final Map<String, dynamic>? body;
  final String? response;
  RequestModel({
    required this.type,
    required this.url,
    required this.headers,
    this.body,
    this.response,
  });

  RequestModel copyWith({
    RequestTypeE? type,
    String? url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    String? response,
  }) {
    return RequestModel(
      type: type ?? this.type,
      url: url ?? this.url,
      headers: headers ?? this.headers,
      body: body ?? this.body,
      response: response ?? this.response,
    );
  }

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
    );
  }

  Request toR() {
    return Request(
      type: RequestType.values[type.index],
      url: url,
      headers: headers,
      body: body != null ? jsonEncode(body) : null,
      response: response,
    );
  }

  @override
  String toString() {
    return 'RequestModel(type: $type, url: $url, headers: $headers, body: $body, response: $response)';
  }

  @override
  List<Object?> get props {
    return [
      type,
      url,
      headers,
      body,
      response,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.toMap(),
      'url': url,
      'headers': headers,
      'body': body,
      'response': response,
    };
  }

  factory RequestModel.fromMap(Map<String, dynamic> map) {
    return RequestModel(
      type: RequestTypeEExt.fromMap(map['type']),
      url: map['url'] as String,
      headers: Map<String, String>.from((map['headers'] as Map<String, String>)),
      body: map['body'] != null ? Map<String, dynamic>.from((map['body'] as Map<String, dynamic>)) : null,
      response: map['response'] != null ? map['response'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestModel.fromJson(String source) => RequestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

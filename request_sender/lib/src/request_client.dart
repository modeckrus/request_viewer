import 'dart:developer';

import 'package:request_model/request_model.dart';

import 'client.dart';

class RequestClient {
  final RequestServiceClient _client;
  RequestClient(MainClient mainClient)
      : _client = RequestServiceClient(mainClient.channel);
  Future<void> makeRequest(RequestModel model) async {
    try {
      final i = model.toR();
      await _client.makeRequest(i);
    } catch (e) {
      log('RequestClient.makeRequest: $e');
    }
  }
}

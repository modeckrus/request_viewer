
import 'package:proto/proto.dart';

import 'client.dart';

class RequestClient{
  final RequestServiceClient _client;
    RequestClient(MainClient mainClient)
      : _client = RequestServiceClient(mainClient.channel);
  Future<void> makeRequest(RequestModel model)async{
    final i = model.toR();
    await _client.makeRequest(i);
  }
}
import 'dart:async';

import 'package:grpc/src/server/call.dart';
import 'package:proto/proto.dart';

class RequestServer extends RequestServiceBase {
  static final StreamController<RequestModel> _requestStreamController =
      StreamController<RequestModel>.broadcast();
  static Stream<RequestModel> get requestStream =>
      _requestStreamController.stream;
  @override
  Future<Request> makeRequest(ServiceCall call, Request request) async {
    final model = RequestModel.fromR(request);
    print(model);
    _requestStreamController.add(model);
    return request;
  }
}

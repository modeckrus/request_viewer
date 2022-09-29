import 'package:dio/dio.dart';
import 'package:request_model/request_model.dart';
import 'package:request_sender/src/request_client.dart';

import 'client.dart';

class RequestSenderInterceptor extends Interceptor {
  final bool convertFormData;
  final RequestClient client = RequestClient(MainClient());
  RequestSenderInterceptor({this.convertFormData = true});

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _renderCurlRepresentation(err.requestOptions);

    return handler.next(err); //continue
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    _renderCurlRepresentation(response.requestOptions);

    return handler.next(response); //continue
  }

  void _renderCurlRepresentation(RequestOptions requestOptions) {
    RequestModel model = RequestModel(
      type: RequestTypeEExt.reverseMap[requestOptions.method]!,
      url: requestOptions.uri.toString(),
      headers: requestOptions.headers
          .map((key, value) => MapEntry(key, value.toString())),
      body: requestOptions.data,
      response: requestOptions.data,
    );
    client.makeRequest(model);
  }
}

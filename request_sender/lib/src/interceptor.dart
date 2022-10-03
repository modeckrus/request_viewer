import 'package:dio/dio.dart';
import 'package:request_model/request_model.dart';
import 'package:request_sender/src/request_client.dart';
import 'dart:convert';
import 'client.dart';

class RequestSenderInterceptor extends Interceptor {
  final bool convertFormData;
  MainClient mainClient = MainClient();
  late RequestClient client = RequestClient(mainClient);
  final String? host;
  RequestSenderInterceptor({this.convertFormData = true, this.host}) {
    if (host != null) {
      mainClient.host = host!;
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _renderCurlRepresentation(err.requestOptions,
        isError: true,
        stackTrace: err.stackTrace ?? StackTrace.current,
        response: err.response);

    return handler.next(err); //continue
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    _renderCurlRepresentation(response.requestOptions,
        response: response, isError: false, stackTrace: StackTrace.current);

    return handler.next(response); //continue
  }

  void _renderCurlRepresentation(RequestOptions requestOptions,
      {Response? response, required bool isError, StackTrace? stackTrace}) {
    try {
      RequestModel model = RequestModel(
        type: RequestTypeEExt.reverseMap[requestOptions.method]!,
        url: requestOptions.uri.toString(),
        headers: requestOptions.headers
            .map((key, value) => MapEntry(key, value.toString())),
        body: parseBody(requestOptions.data),
        response: parseResponse(response?.data),
        isError: isError,
        stackTrace: stackTrace?.toString(),
      );
      client.makeRequest(model);
    } catch (e) {
      print(e);
    }
  }
}

Map<String, dynamic>? parseBody(dynamic body) {
  if (body is Map<String, dynamic>) {
    return body;
  }
  if (body is String) {
    try {
      return jsonDecode(body);
    } catch (e) {
      return null;
    }
  } else {
    return null;
  }
}

String parseResponse(dynamic body) {
  if (body is Map || body is List<dynamic>) {
    return jsonEncode(body);
  }
  return body.toString();
}

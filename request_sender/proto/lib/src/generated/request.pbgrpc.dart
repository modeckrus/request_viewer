///
//  Generated code. Do not modify.
//  source: request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'request.pb.dart' as $0;
export 'request.pb.dart';

class RequestServiceClient extends $grpc.Client {
  static final _$makeRequest = $grpc.ClientMethod<$0.Request, $0.Request>(
      '/RequestService/MakeRequest',
      ($0.Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Request.fromBuffer(value));

  RequestServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Request> makeRequest($0.Request request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$makeRequest, request, options: options);
  }
}

abstract class RequestServiceBase extends $grpc.Service {
  $core.String get $name => 'RequestService';

  RequestServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Request, $0.Request>(
        'MakeRequest',
        makeRequest_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Request.fromBuffer(value),
        ($0.Request value) => value.writeToBuffer()));
  }

  $async.Future<$0.Request> makeRequest_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Request> request) async {
    return makeRequest(call, await request);
  }

  $async.Future<$0.Request> makeRequest(
      $grpc.ServiceCall call, $0.Request request);
}

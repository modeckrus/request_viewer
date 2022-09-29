///
//  Generated code. Do not modify.
//  source: request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class RequestType extends $pb.ProtobufEnum {
  static const RequestType GET = RequestType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GET');
  static const RequestType POST = RequestType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'POST');
  static const RequestType PUT = RequestType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PUT');
  static const RequestType DELETE = RequestType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DELETE');
  static const RequestType PATCH = RequestType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PATCH');

  static const $core.List<RequestType> values = <RequestType> [
    GET,
    POST,
    PUT,
    DELETE,
    PATCH,
  ];

  static final $core.Map<$core.int, RequestType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RequestType? valueOf($core.int value) => _byValue[value];

  const RequestType._($core.int v, $core.String n) : super(v, n);
}


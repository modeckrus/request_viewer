///
//  Generated code. Do not modify.
//  source: request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use requestTypeDescriptor instead')
const RequestType$json = const {
  '1': 'RequestType',
  '2': const [
    const {'1': 'GET', '2': 0},
    const {'1': 'POST', '2': 1},
    const {'1': 'PUT', '2': 2},
    const {'1': 'DELETE', '2': 3},
    const {'1': 'PATCH', '2': 4},
  ],
};

/// Descriptor for `RequestType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List requestTypeDescriptor = $convert.base64Decode('CgtSZXF1ZXN0VHlwZRIHCgNHRVQQABIICgRQT1NUEAESBwoDUFVUEAISCgoGREVMRVRFEAMSCQoFUEFUQ0gQBA==');
@$core.Deprecated('Use requestDescriptor instead')
const Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.RequestType', '10': 'type'},
    const {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
    const {'1': 'body', '3': 3, '4': 1, '5': 9, '10': 'body'},
    const {'1': 'headers', '3': 4, '4': 3, '5': 11, '6': '.Request.HeadersEntry', '10': 'headers'},
    const {'1': 'response', '3': 5, '4': 1, '5': 9, '10': 'response'},
    const {'1': 'isError', '3': 6, '4': 1, '5': 8, '10': 'isError'},
    const {'1': 'stackTrace', '3': 7, '4': 1, '5': 9, '9': 0, '10': 'stackTrace', '17': true},
  ],
  '3': const [Request_HeadersEntry$json],
  '8': const [
    const {'1': '_stackTrace'},
  ],
};

@$core.Deprecated('Use requestDescriptor instead')
const Request_HeadersEntry$json = const {
  '1': 'HeadersEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDescriptor = $convert.base64Decode('CgdSZXF1ZXN0EiAKBHR5cGUYASABKA4yDC5SZXF1ZXN0VHlwZVIEdHlwZRIQCgN1cmwYAiABKAlSA3VybBISCgRib2R5GAMgASgJUgRib2R5Ei8KB2hlYWRlcnMYBCADKAsyFS5SZXF1ZXN0LkhlYWRlcnNFbnRyeVIHaGVhZGVycxIaCghyZXNwb25zZRgFIAEoCVIIcmVzcG9uc2USGAoHaXNFcnJvchgGIAEoCFIHaXNFcnJvchIjCgpzdGFja1RyYWNlGAcgASgJSABSCnN0YWNrVHJhY2WIAQEaOgoMSGVhZGVyc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAFCDQoLX3N0YWNrVHJhY2U=');

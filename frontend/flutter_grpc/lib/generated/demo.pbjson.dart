// This is a generated file - do not edit.
//
// Generated from demo.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor =
    $convert.base64Decode('CgVFbXB0eQ==');

@$core.Deprecated('Use greetingRequestDescriptor instead')
const GreetingRequest$json = {
  '1': 'GreetingRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'language', '3': 2, '4': 1, '5': 9, '10': 'language'},
  ],
};

/// Descriptor for `GreetingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List greetingRequestDescriptor = $convert.base64Decode(
    'Cg9HcmVldGluZ1JlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRIaCghsYW5ndWFnZRgCIAEoCV'
    'IIbGFuZ3VhZ2U=');

@$core.Deprecated('Use greetingResponseDescriptor instead')
const GreetingResponse$json = {
  '1': 'GreetingResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    {'1': 'timestamp', '3': 2, '4': 1, '5': 9, '10': 'timestamp'},
  ],
};

/// Descriptor for `GreetingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List greetingResponseDescriptor = $convert.base64Decode(
    'ChBHcmVldGluZ1Jlc3BvbnNlEhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2USHAoJdGltZXN0YW'
    '1wGAIgASgJUgl0aW1lc3RhbXA=');

@$core.Deprecated('Use userRequestDescriptor instead')
const UserRequest$json = {
  '1': 'UserRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
  ],
};

/// Descriptor for `UserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userRequestDescriptor = $convert
    .base64Decode('CgtVc2VyUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgFUgZ1c2VySWQ=');

@$core.Deprecated('Use userResponseDescriptor instead')
const UserResponse$json = {
  '1': 'UserResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    {'1': 'role', '3': 4, '4': 1, '5': 9, '10': 'role'},
    {'1': 'is_active', '3': 5, '4': 1, '5': 8, '10': 'isActive'},
  ],
};

/// Descriptor for `UserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userResponseDescriptor = $convert.base64Decode(
    'CgxVc2VyUmVzcG9uc2USDgoCaWQYASABKAVSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSFAoFZW'
    '1haWwYAyABKAlSBWVtYWlsEhIKBHJvbGUYBCABKAlSBHJvbGUSGwoJaXNfYWN0aXZlGAUgASgI'
    'Ughpc0FjdGl2ZQ==');

@$core.Deprecated('Use productsRequestDescriptor instead')
const ProductsRequest$json = {
  '1': 'ProductsRequest',
  '2': [
    {'1': 'category', '3': 1, '4': 1, '5': 9, '10': 'category'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '10': 'limit'},
  ],
};

/// Descriptor for `ProductsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List productsRequestDescriptor = $convert.base64Decode(
    'Cg9Qcm9kdWN0c1JlcXVlc3QSGgoIY2F0ZWdvcnkYASABKAlSCGNhdGVnb3J5EhQKBWxpbWl0GA'
    'IgASgFUgVsaW1pdA==');

@$core.Deprecated('Use productsResponseDescriptor instead')
const ProductsResponse$json = {
  '1': 'ProductsResponse',
  '2': [
    {
      '1': 'products',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.demo.Product',
      '10': 'products'
    },
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
  ],
};

/// Descriptor for `ProductsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List productsResponseDescriptor = $convert.base64Decode(
    'ChBQcm9kdWN0c1Jlc3BvbnNlEikKCHByb2R1Y3RzGAEgAygLMg0uZGVtby5Qcm9kdWN0Ughwcm'
    '9kdWN0cxIfCgt0b3RhbF9jb3VudBgCIAEoBVIKdG90YWxDb3VudA==');

@$core.Deprecated('Use productDescriptor instead')
const Product$json = {
  '1': 'Product',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'price', '3': 4, '4': 1, '5': 1, '10': 'price'},
    {'1': 'category', '3': 5, '4': 1, '5': 9, '10': 'category'},
    {'1': 'in_stock', '3': 6, '4': 1, '5': 8, '10': 'inStock'},
  ],
};

/// Descriptor for `Product`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List productDescriptor = $convert.base64Decode(
    'CgdQcm9kdWN0Eg4KAmlkGAEgASgFUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEiAKC2Rlc2NyaX'
    'B0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhIUCgVwcmljZRgEIAEoAVIFcHJpY2USGgoIY2F0ZWdv'
    'cnkYBSABKAlSCGNhdGVnb3J5EhkKCGluX3N0b2NrGAYgASgIUgdpblN0b2Nr');

@$core.Deprecated('Use timeResponseDescriptor instead')
const TimeResponse$json = {
  '1': 'TimeResponse',
  '2': [
    {'1': 'current_time', '3': 1, '4': 1, '5': 9, '10': 'currentTime'},
    {'1': 'timezone', '3': 2, '4': 1, '5': 9, '10': 'timezone'},
    {'1': 'timestamp_unix', '3': 3, '4': 1, '5': 3, '10': 'timestampUnix'},
  ],
};

/// Descriptor for `TimeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timeResponseDescriptor = $convert.base64Decode(
    'CgxUaW1lUmVzcG9uc2USIQoMY3VycmVudF90aW1lGAEgASgJUgtjdXJyZW50VGltZRIaCgh0aW'
    '1lem9uZRgCIAEoCVIIdGltZXpvbmUSJQoOdGltZXN0YW1wX3VuaXgYAyABKANSDXRpbWVzdGFt'
    'cFVuaXg=');

@$core.Deprecated('Use updateMessageDescriptor instead')
const UpdateMessage$json = {
  '1': 'UpdateMessage',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'timestamp', '3': 3, '4': 1, '5': 9, '10': 'timestamp'},
    {'1': 'type', '3': 4, '4': 1, '5': 9, '10': 'type'},
  ],
};

/// Descriptor for `UpdateMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMessageDescriptor = $convert.base64Decode(
    'Cg1VcGRhdGVNZXNzYWdlEg4KAmlkGAEgASgJUgJpZBIYCgdtZXNzYWdlGAIgASgJUgdtZXNzYW'
    'dlEhwKCXRpbWVzdGFtcBgDIAEoCVIJdGltZXN0YW1wEhIKBHR5cGUYBCABKAlSBHR5cGU=');

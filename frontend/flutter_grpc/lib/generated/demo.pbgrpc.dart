// This is a generated file - do not edit.
//
// Generated from demo.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'demo.pb.dart' as $0;

export 'demo.pb.dart';

/// Demo service für Flutter Integration
@$pb.GrpcServiceName('demo.DemoService')
class DemoServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  DemoServiceClient(super.channel, {super.options, super.interceptors});

  /// Einfache Begrüßung
  $grpc.ResponseFuture<$0.GreetingResponse> getGreeting(
    $0.GreetingRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getGreeting, request, options: options);
  }

  /// Benutzerinformationen abrufen
  $grpc.ResponseFuture<$0.UserResponse> getUserInfo(
    $0.UserRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getUserInfo, request, options: options);
  }

  /// Liste von Produkten abrufen
  $grpc.ResponseFuture<$0.ProductsResponse> getProducts(
    $0.ProductsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getProducts, request, options: options);
  }

  /// Server-Zeit abrufen
  $grpc.ResponseFuture<$0.TimeResponse> getServerTime(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getServerTime, request, options: options);
  }

  /// Streaming: Server sendet mehrere Nachrichten
  $grpc.ResponseStream<$0.UpdateMessage> getLiveUpdates(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(
        _$getLiveUpdates, $async.Stream.fromIterable([request]),
        options: options);
  }

  // method descriptors

  static final _$getGreeting =
      $grpc.ClientMethod<$0.GreetingRequest, $0.GreetingResponse>(
          '/demo.DemoService/GetGreeting',
          ($0.GreetingRequest value) => value.writeToBuffer(),
          $0.GreetingResponse.fromBuffer);
  static final _$getUserInfo =
      $grpc.ClientMethod<$0.UserRequest, $0.UserResponse>(
          '/demo.DemoService/GetUserInfo',
          ($0.UserRequest value) => value.writeToBuffer(),
          $0.UserResponse.fromBuffer);
  static final _$getProducts =
      $grpc.ClientMethod<$0.ProductsRequest, $0.ProductsResponse>(
          '/demo.DemoService/GetProducts',
          ($0.ProductsRequest value) => value.writeToBuffer(),
          $0.ProductsResponse.fromBuffer);
  static final _$getServerTime = $grpc.ClientMethod<$0.Empty, $0.TimeResponse>(
      '/demo.DemoService/GetServerTime',
      ($0.Empty value) => value.writeToBuffer(),
      $0.TimeResponse.fromBuffer);
  static final _$getLiveUpdates =
      $grpc.ClientMethod<$0.Empty, $0.UpdateMessage>(
          '/demo.DemoService/GetLiveUpdates',
          ($0.Empty value) => value.writeToBuffer(),
          $0.UpdateMessage.fromBuffer);
}

@$pb.GrpcServiceName('demo.DemoService')
abstract class DemoServiceBase extends $grpc.Service {
  $core.String get $name => 'demo.DemoService';

  DemoServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GreetingRequest, $0.GreetingResponse>(
        'GetGreeting',
        getGreeting_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GreetingRequest.fromBuffer(value),
        ($0.GreetingResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserRequest, $0.UserResponse>(
        'GetUserInfo',
        getUserInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserRequest.fromBuffer(value),
        ($0.UserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ProductsRequest, $0.ProductsResponse>(
        'GetProducts',
        getProducts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ProductsRequest.fromBuffer(value),
        ($0.ProductsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.TimeResponse>(
        'GetServerTime',
        getServerTime_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.TimeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.UpdateMessage>(
        'GetLiveUpdates',
        getLiveUpdates_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.UpdateMessage value) => value.writeToBuffer()));
  }

  $async.Future<$0.GreetingResponse> getGreeting_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GreetingRequest> $request) async {
    return getGreeting($call, await $request);
  }

  $async.Future<$0.GreetingResponse> getGreeting(
      $grpc.ServiceCall call, $0.GreetingRequest request);

  $async.Future<$0.UserResponse> getUserInfo_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.UserRequest> $request) async {
    return getUserInfo($call, await $request);
  }

  $async.Future<$0.UserResponse> getUserInfo(
      $grpc.ServiceCall call, $0.UserRequest request);

  $async.Future<$0.ProductsResponse> getProducts_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ProductsRequest> $request) async {
    return getProducts($call, await $request);
  }

  $async.Future<$0.ProductsResponse> getProducts(
      $grpc.ServiceCall call, $0.ProductsRequest request);

  $async.Future<$0.TimeResponse> getServerTime_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return getServerTime($call, await $request);
  }

  $async.Future<$0.TimeResponse> getServerTime(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Stream<$0.UpdateMessage> getLiveUpdates_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async* {
    yield* getLiveUpdates($call, await $request);
  }

  $async.Stream<$0.UpdateMessage> getLiveUpdates(
      $grpc.ServiceCall call, $0.Empty request);
}

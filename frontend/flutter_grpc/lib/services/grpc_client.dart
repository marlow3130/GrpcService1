import 'package:grpc/grpc.dart';
import '../generated/demo.pbgrpc.dart';
import '../generated/greet.pbgrpc.dart';

class GrpcClient {
  late ClientChannel _channel;
  late DemoServiceClient _demoClient;
  late GreeterClient _greeterClient;

  // Singleton Pattern
  static final GrpcClient _instance = GrpcClient._internal();
  factory GrpcClient() => _instance;
  GrpcClient._internal();

  void initialize({String host = 'localhost', int port = 5192}) {
    _channel = ClientChannel(
      host,
      port: port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    _demoClient = DemoServiceClient(_channel);
    _greeterClient = GreeterClient(_channel);
  }

  // Demo Service Methods
  Future<GreetingResponse> getGreeting({
    required String name,
    String language = 'en',
  }) async {
    final request = GreetingRequest()
      ..name = name
      ..language = language;

    try {
      final response = await _demoClient.getGreeting(request);
      return response;
    } catch (e) {
      print('Error getting greeting: $e');
      rethrow;
    }
  }

  Future<UserResponse> getUserInfo(int userId) async {
    final request = UserRequest()..userId = userId;

    try {
      final response = await _demoClient.getUserInfo(request);
      return response;
    } catch (e) {
      print('Error getting user info: $e');
      rethrow;
    }
  }

  Future<ProductsResponse> getProducts({
    String category = '',
    int limit = 0,
  }) async {
    final request = ProductsRequest()
      ..category = category
      ..limit = limit;

    try {
      final response = await _demoClient.getProducts(request);
      return response;
    } catch (e) {
      print('Error getting products: $e');
      rethrow;
    }
  }

  Future<TimeResponse> getServerTime() async {
    final request = Empty();

    try {
      final response = await _demoClient.getServerTime(request);
      return response;
    } catch (e) {
      print('Error getting server time: $e');
      rethrow;
    }
  }

  Stream<UpdateMessage> getLiveUpdates() {
    final request = Empty();

    try {
      return _demoClient.getLiveUpdates(request);
    } catch (e) {
      print('Error getting live updates: $e');
      rethrow;
    }
  }

  // Greeter Service Methods
  Future<HelloReply> sayHello(String name) async {
    final request = HelloRequest()..name = name;

    try {
      final response = await _greeterClient.sayHello(request);
      return response;
    } catch (e) {
      print('Error saying hello: $e');
      rethrow;
    }
  }

  void dispose() {
    _channel.shutdown();
  }
}

import 'package:flutter/material.dart';
import '../services/grpc_client.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GrpcClient _grpcClient = GrpcClient();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  String _greetingResult = '';
  String _userInfoResult = '';
  String _productsResult = '';
  String _serverTimeResult = '';
  String _helloResult = '';
  List<String> _liveUpdates = [];
  bool _isStreamingUpdates = false;

  @override
  void initState() {
    super.initState();
    _grpcClient.initialize();
  }

  @override
  void dispose() {
    _grpcClient.dispose();
    _nameController.dispose();
    _userIdController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('gRPC Flutter Demo'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildGreetingSection(),
            const Divider(height: 32),
            _buildUserInfoSection(),
            const Divider(height: 32),
            _buildProductsSection(),
            const Divider(height: 32),
            _buildServerTimeSection(),
            const Divider(height: 32),
            _buildHelloSection(),
            const Divider(height: 32),
            _buildLiveUpdatesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildGreetingSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Multilingual Greeting',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _getGreeting('de'),
                    child: const Text('Deutsch'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _getGreeting('en'),
                    child: const Text('English'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _getGreeting('es'),
                    child: const Text('Español'),
                  ),
                ),
              ],
            ),
            if (_greetingResult.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  border: Border.all(color: Colors.green.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(_greetingResult),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'User Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _userIdController,
              decoration: const InputDecoration(
                labelText: 'User ID (1-3)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _getUserInfo,
              child: const Text('Get User Info'),
            ),
            if (_userInfoResult.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  border: Border.all(color: Colors.blue.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(_userInfoResult),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildProductsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Products',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _categoryController,
              decoration: const InputDecoration(
                labelText: 'Category (Electronics, Home, Books, Clothing)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _getProducts(),
                    child: const Text('All Products'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _getProducts(limit: 3),
                    child: const Text('Limit 3'),
                  ),
                ),
              ],
            ),
            if (_productsResult.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  border: Border.all(color: Colors.orange.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(_productsResult),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildServerTimeSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Server Time',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _getServerTime,
              child: const Text('Get Server Time'),
            ),
            if (_serverTimeResult.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  border: Border.all(color: Colors.purple.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(_serverTimeResult),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHelloSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Simple Hello (Original Service)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _sayHello,
              child: const Text('Say Hello'),
            ),
            if (_helloResult.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  border: Border.all(color: Colors.teal.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(_helloResult),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLiveUpdatesSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Live Updates (Streaming)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _isStreamingUpdates ? null : _startLiveUpdates,
                  child: const Text('Start Streaming'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _isStreamingUpdates ? _stopLiveUpdates : null,
                  child: const Text('Stop Streaming'),
                ),
              ],
            ),
            if (_liveUpdates.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                height: 200,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.builder(
                  itemCount: _liveUpdates.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        _liveUpdates[index],
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _getGreeting(String language) async {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter a name')));
      return;
    }

    try {
      final response = await _grpcClient.getGreeting(
        name: _nameController.text,
        language: language,
      );

      setState(() {
        _greetingResult =
            '${response.message}\n\nTimestamp: ${response.timestamp}';
      });
    } catch (e) {
      setState(() {
        _greetingResult = 'Error: $e';
      });
    }
  }

  void _getUserInfo() async {
    final userIdText = _userIdController.text;
    if (userIdText.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter a user ID')));
      return;
    }

    final userId = int.tryParse(userIdText);
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid number')),
      );
      return;
    }

    try {
      final response = await _grpcClient.getUserInfo(userId);

      setState(() {
        _userInfoResult =
            '''
ID: ${response.id}
Name: ${response.name}
Email: ${response.email}
Role: ${response.role}
Active: ${response.isActive ? 'Yes' : 'No'}
        '''
                .trim();
      });
    } catch (e) {
      setState(() {
        _userInfoResult = 'Error: $e';
      });
    }
  }

  void _getProducts({int limit = 0}) async {
    try {
      final response = await _grpcClient.getProducts(
        category: _categoryController.text,
        limit: limit,
      );

      final buffer = StringBuffer();
      buffer.writeln('Total Products: ${response.totalCount}');
      buffer.writeln('Returned: ${response.products.length}\n');

      for (final product in response.products) {
        buffer.writeln(
          '${product.name} - €${product.price.toStringAsFixed(2)}',
        );
        buffer.writeln('  Category: ${product.category}');
        buffer.writeln('  In Stock: ${product.inStock ? 'Yes' : 'No'}');
        buffer.writeln('  ${product.description}\n');
      }

      setState(() {
        _productsResult = buffer.toString();
      });
    } catch (e) {
      setState(() {
        _productsResult = 'Error: $e';
      });
    }
  }

  void _getServerTime() async {
    try {
      final response = await _grpcClient.getServerTime();

      setState(() {
        _serverTimeResult =
            '''
Current Time: ${response.currentTime}
Timezone: ${response.timezone}
Unix Timestamp: ${response.timestampUnix}
        '''
                .trim();
      });
    } catch (e) {
      setState(() {
        _serverTimeResult = 'Error: $e';
      });
    }
  }

  void _sayHello() async {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter a name')));
      return;
    }

    try {
      final response = await _grpcClient.sayHello(_nameController.text);

      setState(() {
        _helloResult = response.message;
      });
    } catch (e) {
      setState(() {
        _helloResult = 'Error: $e';
      });
    }
  }

  void _startLiveUpdates() {
    setState(() {
      _isStreamingUpdates = true;
      _liveUpdates.clear();
    });

    _grpcClient.getLiveUpdates().listen(
      (update) {
        setState(() {
          _liveUpdates.insert(
            0,
            '[${update.type.toUpperCase()}] ${update.timestamp}: ${update.message}',
          );
          // Keep only last 20 updates
          if (_liveUpdates.length > 20) {
            _liveUpdates.removeLast();
          }
        });
      },
      onError: (error) {
        setState(() {
          _liveUpdates.insert(0, 'Error: $error');
          _isStreamingUpdates = false;
        });
      },
      onDone: () {
        setState(() {
          _isStreamingUpdates = false;
        });
      },
    );
  }

  void _stopLiveUpdates() {
    setState(() {
      _isStreamingUpdates = false;
    });
  }
}

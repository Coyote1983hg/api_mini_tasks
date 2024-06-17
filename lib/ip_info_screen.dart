import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IpInfoScreen extends StatefulWidget {
  const IpInfoScreen({super.key});

  @override
  State<IpInfoScreen> createState() => _IpInfoScreenState();
}

class _IpInfoScreenState extends State<IpInfoScreen> {
  String _ipInfo = '';

  Future<void> fetchIpInfo() async {
    final response = await http.get(Uri.parse('https://ipinfo.io/json'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final ipInfoString = jsonEncode(jsonData);
      setState(() {
        _ipInfo = ipInfoString;
      });
    } else {
      throw Exception('Failed to load IP info');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IP Info'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                fetchIpInfo();
              },
              child: const Text('Get IP Info'),
            ),
            const SizedBox(height: 16),
            _ipInfo.isNotEmpty
                ? Text(_ipInfo)
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

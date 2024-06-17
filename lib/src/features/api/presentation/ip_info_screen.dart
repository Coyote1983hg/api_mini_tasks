import 'package:api_mini_tasks/ip_info_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class IpInfoScreen extends StatefulWidget {
  const IpInfoScreen({super.key});

  @override
  State<IpInfoScreen> createState() => _IpInfoScreenState();
}

class _IpInfoScreenState extends State<IpInfoScreen> {
  late Future<IpInfoModel> _ipInfoFuture;

  @override
  void initState() {
    super.initState();
    _ipInfoFuture = fetchIpInfo();
  }

  Future<IpInfoModel> fetchIpInfo() async {
    final response = await http.get(Uri.parse('https://ipinfo.io/json'));

    if (response.statusCode == 200) {
      return IpInfoModel.fromJson(jsonDecode(response.body));
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
                setState(() {
                  _ipInfoFuture = fetchIpInfo();
                });
              },
              child: const Text('Get IP Info'),
            ),
            const SizedBox(height: 16),
            FutureBuilder<IpInfoModel>(
              future: _ipInfoFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return IpInfoDisplay(ipInfo: snapshot.data!);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class IpInfoDisplay extends StatelessWidget {
  final IpInfoModel ipInfo;

  const IpInfoDisplay({super.key, required this.ipInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('IP: ${ipInfo.ip}'),
        Text('City: ${ipInfo.city}'),
        Text('Region: ${ipInfo.region}'),
        Text('Country: ${ipInfo.country}'),
        Text('Location: ${ipInfo.location}'),
        Text('Organization: ${ipInfo.organization}'),
        Text('Postal Code: ${ipInfo.postalCode}'),
        Text('Timezone: ${ipInfo.timezone}'),
      ],
    );
  }
}

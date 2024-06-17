import 'package:api_mini_tasks/src/features/api/presentation/ip_info_screen.dart';
import 'package:flutter/material.dart';





class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IP Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IpInfoScreen(),
    );
  }
}
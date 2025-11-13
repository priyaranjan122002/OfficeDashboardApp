
import 'package:flutter/material.dart';
import 'screens/dashboard_home.dart';

void main() => runApp(const OfficeDashboardApp());

class OfficeDashboardApp extends StatelessWidget {
  const OfficeDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Office Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: const DashboardHome(),
    );
  }
}

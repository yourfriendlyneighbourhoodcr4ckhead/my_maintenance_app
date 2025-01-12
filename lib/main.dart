
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'machine_details.dart';
import 'notifications.dart';
import 'settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Add the const keyword
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => DashboardScreen(),
        '/machine_details': (context) => MachineDetailsScreen(),
        '/notifications': (context) => NotificationsScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}


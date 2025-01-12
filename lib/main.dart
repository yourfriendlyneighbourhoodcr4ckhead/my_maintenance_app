import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'dashboard.dart';
import 'machine_details.dart';
import 'notifications.dart';
import 'settings.dart';
import 'instruction_manual.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maintenance App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey[800],
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey,
        ).copyWith(
          secondary: Colors.amberAccent,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => DashboardScreen(),
        '/machine_details': (context) => MachineDetailsScreen(),
        '/notifications': (context) => NotificationsScreen(),
        '/settings': (context) => SettingsScreen(),
        '/instruction_manual': (context) => InstructionManualScreen(),
      },
    );
  }
}

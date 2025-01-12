import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the global app state
    final appState = Provider.of<AppState>(context);
    final machines = appState.machines; // your global list

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Navigate to notifications screen
              Navigator.pushNamed(context, '/notifications');
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings screen
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.95,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemCount: machines.length,
        itemBuilder: (context, index) {
          final machine = machines[index];
          String status = machine.status;
          Color statusColor = status == 'down'
              ? Colors.red
              : status == 'needs_maintenance'
              ? Colors.orange
              : Colors.green;

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/machine_details',
                arguments: {
                  'machineName': machine.name,
                },
              );
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: statusColor,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.build_circle,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(height: 8),
                    Text(
                      machine.name,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

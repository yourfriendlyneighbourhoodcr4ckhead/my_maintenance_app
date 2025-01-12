import 'package:flutter/material.dart';


class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: 10, // Replace with actual machine count
        itemBuilder: (context, index) {
          // Example machine status data
          String machineName = 'CP3L0${index + 1}';
          String status = index % 3 == 0
              ? 'down'
              : index % 3 == 1
              ? 'needs_maintenance'
              : 'running';
          Color statusColor = status == 'down'
              ? Colors.red
              : status == 'needs_maintenance'
              ? Colors.orange
              : Colors.green;

          return GestureDetector(
            onTap: () {
              // Navigate to machine details screen
              Navigator.pushNamed(context, '/machine_details',
                  arguments: {
                    'machineName': machineName,
                    'status': status,
                  });
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
                      machineName,
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

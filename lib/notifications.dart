import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'icon': Icons.warning,
      'color': Colors.orange,
      'title': 'CP3L02 needs maintenance soon',
      'subtitle': 'Check pressure levels',
      'machineName': 'CP3L02',
    },
    {
      'icon': Icons.error,
      'color': Colors.red,
      'title': 'CP3L05 is down!',
      'subtitle': 'Immediate action required',
      'machineName': 'CP3L05',
    },
    {
      'icon': Icons.check_circle,
      'color': Colors.green,
      'title': 'CP3L01 running smoothly',
      'subtitle': 'No issues detected',
      'machineName': 'CP3L01',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // If you need to react to changes in machines, you can watch the AppState here,
    // but for now we just show static notifications:
    // final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => SizedBox(height: 8),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            child: ListTile(
              leading: Icon(notification['icon'], color: notification['color']),
              title: Text(notification['title']),
              subtitle: Text(notification['subtitle']),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate directly to machine details for the relevant machine
                final machineName = notification['machineName'] ?? '';
                Navigator.pushNamed(
                  context,
                  '/machine_details',
                  arguments: {
                    'machineName': machineName,
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

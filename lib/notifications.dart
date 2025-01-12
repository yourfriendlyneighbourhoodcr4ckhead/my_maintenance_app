import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.warning, color: Colors.orange),
            title: Text('CP3L02 needs maintenance soon'),
            subtitle: Text('Check pressure levels'),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.error, color: Colors.red),
            title: Text('CP3L05 is down!'),
            subtitle: Text('Immediate action required'),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.check_circle, color: Colors.green),
            title: Text('CP3L01 running smoothly'),
            subtitle: Text('No issues detected'),
            trailing: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}

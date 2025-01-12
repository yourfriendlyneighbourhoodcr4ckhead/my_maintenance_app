import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  bool notificationsEnabled = true; // This would be read from actual state if needed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Profile Settings',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('Edit Profile'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Placeholder for edit profile
              },
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Notifications',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Card(
            child: SwitchListTile(
              title: Text('Enable Notifications'),
              value: notificationsEnabled,
              onChanged: (bool value) {
                // Toggle notifications
                notificationsEnabled = value;
              },
              secondary: Icon(Icons.notifications),
            ),
          ),
          SizedBox(height: 16),
          TextButton.icon(
            onPressed: () {
              // Placeholder for logout functionality
              Navigator.pop(context);
            },
            icon: Icon(Icons.exit_to_app, color: Colors.red),
            label: Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

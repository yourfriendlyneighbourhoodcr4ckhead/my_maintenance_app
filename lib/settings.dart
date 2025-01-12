import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Profile Settings', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Edit Profile'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Placeholder for edit profile
              },
            ),
            Divider(),
            SizedBox(height: 16),
            Text('Notifications', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: true,
              onChanged: (bool value) {
                // Placeholder for notification toggle
              },
            ),
            Divider(),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Placeholder for logout functionality
                Navigator.pop(context);
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

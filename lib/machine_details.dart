import 'package:flutter/material.dart';

class MachineDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final String machineName = arguments['machineName'];
    final String status = arguments['status'];

    return Scaffold(
      appBar: AppBar(
        title: Text('$machineName Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Parameter', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Value', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Temperature'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('75°C'),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Pressure'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('12 bar'),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('RPM'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('1500'),
                  ),
                ]),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Condition:', style: TextStyle(fontSize: 18)),
                SizedBox(width: 8),
                Container(
                  width: 20,
                  height: 20,
                  color: status == 'down'
                      ? Colors.red
                      : status == 'needs_maintenance'
                      ? Colors.orange
                      : Colors.green,
                ),
                SizedBox(width: 8),
                Text(
                  status == 'down'
                      ? 'Down'
                      : status == 'needs_maintenance'
                      ? 'Needs Maintenance'
                      : 'Running Smoothly',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to issue resolution steps
              },
              child: Text('View Steps to Fix Issue'),
            ),
            SizedBox(height: 16),
            Text(
              'Maintenance History',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Maintenance Date: 2025-01-0${index + 1}'),
                  subtitle: Text('Issue: Sample Issue ${index + 1}'),
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Placeholder for updating machine status
              },
              child: Text('Update Machine Status'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class InstructionManualScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instruction Manual'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Steps to Fix Issue',
                style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text('Step 1: Turn off the machine.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text('Step 2: Check pressure levels.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text('Step 3: Replace faulty parts if necessary.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text('Step 4: Restart the machine.'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

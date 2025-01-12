import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class MachineDetailsScreen extends StatefulWidget {
  @override
  _MachineDetailsScreenState createState() => _MachineDetailsScreenState();
}

class _MachineDetailsScreenState extends State<MachineDetailsScreen> {
  String? selectedStatus;

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final String machineName = arguments['machineName'];

    final appState = Provider.of<AppState>(context);
    final machine = appState.getMachineByName(machineName);

    // If machine is not found, handle gracefully
    if (machine == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Machine Not Found')),
        body: Center(child: Text('No machine found with name: $machineName')),
      );
    }

    // Current status color
    Color statusColor = machine.status == 'down'
        ? Colors.red
        : machine.status == 'needs_maintenance'
        ? Colors.orange
        : Colors.green;

    return Scaffold(
      appBar: AppBar(
        title: Text('${machine.name} Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Machine Status
            Row(
              children: [
                Text(
                  'Status: ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  _statusLabel(machine.status),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Some placeholder table
            Card(
              elevation: 2,
              child: Table(
                border: TableBorder.all(color: Colors.grey.shade300),
                children: [
                  _buildTableRow('Parameter', 'Value', isHeader: true),
                  _buildTableRow('Temperature', '75°C'),
                  _buildTableRow('Pressure', '12 bar'),
                  _buildTableRow('RPM', '1500'),
                ],
              ),
            ),
            SizedBox(height: 16),

            // View Steps
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/instruction_manual');
              },
              child: Text('View Steps to Fix Issue'),
            ),
            SizedBox(height: 16),

            // Maintenance History (Placeholder)
            Text(
              'Maintenance History',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    leading: Icon(Icons.history),
                    title: Text('Maintenance Date: 2025-01-0${index + 1}'),
                    subtitle: Text('Issue: Sample Issue ${index + 1}'),
                  ),
                );
              },
            ),
            SizedBox(height: 16),

            // Dropdown to update status
            Text('Update Machine Status',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<String>(
                  value: selectedStatus,
                  hint: Text('Select Status'),
                  underline: SizedBox(),
                  items: <String>[
                    'Running Green',
                    'Needs Maintenance Orange',
                    'Down Red'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedStatus = newValue;
                    });
                    // Convert the user's drop down choice to the actual status
                    // e.g. "Running Green" -> "running"
                    if (newValue != null) {
                      String statusKey;
                      if (newValue.contains('Running')) {
                        statusKey = 'running';
                      } else if (newValue.contains('Maintenance')) {
                        statusKey = 'needs_maintenance';
                      } else {
                        statusKey = 'down';
                      }
                      // Update in our app state
                      appState.updateMachineStatus(machine.name, statusKey);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _statusLabel(String status) {
    switch (status) {
      case 'down':
        return 'Down';
      case 'needs_maintenance':
        return 'Needs Maintenance';
      default:
        return 'Running Smoothly';
    }
  }

  TableRow _buildTableRow(String param, String value, {bool isHeader = false}) {
    return TableRow(
      decoration: BoxDecoration(
        color: isHeader ? Colors.blueGrey.shade100 : Colors.transparent,
      ),
      children: [
        _buildCell(param, isHeader: isHeader),
        _buildCell(value, isHeader: isHeader),
      ],
    );
  }

  Widget _buildCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

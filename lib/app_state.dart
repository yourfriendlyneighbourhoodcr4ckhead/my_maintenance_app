import 'package:flutter/foundation.dart';

// A simple Machine model
class Machine {
  String name;
  String status; // 'down' | 'needs_maintenance' | 'running'

  Machine({
    required this.name,
    required this.status,
  });
}

// Our global app state, containing a list of machines
class AppState extends ChangeNotifier {
  // Example initial list
  final List<Machine> _machines = [
    Machine(name: 'CP3L01', status: 'running'),
    Machine(name: 'CP3L02', status: 'needs_maintenance'),
    Machine(name: 'CP3L03', status: 'down'),
    Machine(name: 'CP3L04', status: 'running'),
    Machine(name: 'CP3L05', status: 'down'),
    Machine(name: 'CP3L06', status: 'needs_maintenance'),
    Machine(name: 'CP3L07', status: 'running'),
    Machine(name: 'CP3L08', status: 'running'),
    Machine(name: 'CP3L09', status: 'needs_maintenance'),
    Machine(name: 'CP3L10', status: 'down'),
  ];

  List<Machine> get machines => _machines;

  /// Update a machine's status and notify listeners
  void updateMachineStatus(String machineName, String newStatus) {
    final machine = _machines.firstWhere(
          (m) => m.name == machineName,
      orElse: () => Machine(name: 'Unknown', status: 'down'),
    );
    machine.status = newStatus;
    notifyListeners();
  }

  /// Find a machine by name (returns null if not found)
  Machine? getMachineByName(String machineName) {
    try {
      return _machines.firstWhere((m) => m.name == machineName);
    } catch (e) {
      return null;
    }
  }
}

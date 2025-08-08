import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome, Admin!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to staff creation screen
              },
              child: const Text('Create Staff'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to teacher creation screen
              },
              child: const Text('Create Teacher'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to student creation screen
              },
              child: const Text('Create Student'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to parent creation screen
              },
              child: const Text('Create Parent'),
            ),
          ],
        ),
      ),
    );
  }
}

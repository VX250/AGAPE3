import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StaffListScreen extends StatelessWidget {
  const StaffListScreen({Key? key}) : super(key: key);

  Stream<QuerySnapshot> getStaffStream() {
    return FirebaseFirestore.instance
        .collection('users')
        .where('role', whereIn: ['admin', 'teacher', 'hod', 'finance'])
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Staff List')),
      body: StreamBuilder<QuerySnapshot>(
        stream: getStaffStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final staffDocs = snapshot.data!.docs;

          if (staffDocs.isEmpty) {
            return const Center(child: Text('No staff found.'));
          }

          return ListView.builder(
            itemCount: staffDocs.length,
            itemBuilder: (context, index) {
              final data = staffDocs[index].data()! as Map<String, dynamic>;
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(data['fullName'] ?? 'No Name'),
                subtitle: Text('Role: ${data['role'] ?? 'No role'}'),
                trailing: Text(data['email'] ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}

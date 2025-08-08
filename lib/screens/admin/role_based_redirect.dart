import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'admin_dashboard_screen.dart';
// TODO: Import other user home screens here
// import 'teacher_home_screen.dart';
// import 'student_home_screen.dart';
// import 'parent_home_screen.dart';

class RoleBasedRedirect extends StatefulWidget {
  const RoleBasedRedirect({Key? key}) : super(key: key);

  @override
  State<RoleBasedRedirect> createState() => _RoleBasedRedirectState();
}

class _RoleBasedRedirectState extends State<RoleBasedRedirect> {
  String? userRole;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserRole();
  }

  Future<void> _fetchUserRole() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      // Not logged in, redirect to login (adjust as needed)
      Navigator.pushReplacementNamed(context, '/login');
      return;
    }

    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      if (!doc.exists || !doc.data()!.containsKey('role')) {
        // No role found, handle appropriately
        setState(() {
          userRole = null;
          isLoading = false;
        });
        return;
      }

      setState(() {
        userRole = doc.data()!['role'] as String;
        isLoading = false;
      });
    } catch (e) {
      // Handle error
      setState(() {
        userRole = null;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (userRole == null) {
      return Scaffold(
        body: Center(child: Text('User role not found. Please contact admin.')),
      );
    }

    // Redirect based on role
    switch (userRole) {
      case 'admin':
        return const AdminDashboardScreen();
      // case 'teacher':
      //   return const TeacherHomeScreen();
      // case 'student':
      //   return const StudentHomeScreen();
      // case 'parent':
      //   return const ParentHomeScreen();
      default:
        return Scaffold(
          body: Center(child: Text('Role "$userRole" does not have access.')),
        );
    }
  }
}

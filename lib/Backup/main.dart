import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import your login screen file
import 'admin_login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AGAPE 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const LoginScreen(), // Show the login screen first
      //home: const AdminLoginScreen(), // for admin/bursar
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AGAPE 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      //home: const LoginScreen(), // Show the login screen first
      home: const AdminLoginScreen(), // for admin/bursar
    );
  }
}

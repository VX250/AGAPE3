import 'package:flutter/material.dart';
import 'register_screen.dart';
// import 'login_screen.dart'; // we'll add this soon
import 'login_screen.dart';
//import 'package:agape1/screens/admin/role_based_redirect.dart';

//agape1\lib\screens\admin

void main() async {
  runApp(const AgapeApp());
}

class AgapeApp extends StatelessWidget {
  const AgapeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AGAPE 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple, useMaterial3: true),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to AGAPE 1',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                  // TODO: Navigate to Login Screen
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 20),

              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RegisterScreen()),
                  );
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

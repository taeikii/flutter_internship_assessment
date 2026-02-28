import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF6366F1),
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              'Andre\nTask Manager User',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Settings, stats & more coming soon'),
          ],
        ),
      ),
    );
  }
}
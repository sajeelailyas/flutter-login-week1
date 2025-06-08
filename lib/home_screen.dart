import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String email;

  HomeScreen({required this.email});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tapCount = 0;

  void _handleTap() {
    setState(() {
      tapCount++;
      if (tapCount == 5) {
        tapCount = 0;
        _showSecretMessage();
      }
    });
  }

  void _showSecretMessage() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('🎉 Secret Unlocked!'),
            content: Text('You found the hidden Easter Egg! 🥚🐰'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cool!'),
              ),
            ],
          ),
    );
  }

  String getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12)
      return "Good Morning! ☀️";
    else if (hour < 17)
      return "Good Afternoon! 🌤";
    else
      return "Good Evening! 🌙";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD4B996),
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Color(0xFFA07855),
      ),
      body: GestureDetector(
        onTap: _handleTap, // tap anywhere on body
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  getGreeting(),
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[800],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  widget.email,
                  style: TextStyle(fontSize: 18, color: Colors.brown[700]),
                ),
                SizedBox(height: 24),
                Text(
                  'Welcome to your Home Screen!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.brown[900],
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  '(Tap 5 times for a surprise!)',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.brown[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

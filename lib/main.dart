import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: LoginScreen(),

      // Handles navigation with parameters
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          final email = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => HomeScreen(email: email),
          );
        }
        return null;
      },
    );
  }
}

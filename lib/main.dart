import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
//import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(CourtApp());
}

class CourtApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CourtDashboard(),
    );
  }
}

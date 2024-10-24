// lib/main.dart
import 'package:flutter/material.dart';
import 'package:gmi_prospect_application/screens/subject_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GMI Prospect Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const SubjectFormScreen(),
    );
  }
}


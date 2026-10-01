import 'package:flutter/material.dart';
import 'package:kuis_060/views/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'kuis_mobile',
      home: LoginPage(),
    );
  }
}
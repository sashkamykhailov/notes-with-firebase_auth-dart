import 'package:fcc_project/views/LoginView.dart';
import 'package:fcc_project/views/RegisterView.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

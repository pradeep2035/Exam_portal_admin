import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sat_portal/screens/question_bank/question_bank.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Admin Upstair',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryIconTheme: IconThemeData(color: Colors.deepPurple),
      ),
      home: QuestionBank(),
    );
  }
}


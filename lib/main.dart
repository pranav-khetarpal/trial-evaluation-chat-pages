import 'package:flutter/material.dart';
import 'package:trial_evaluation_chatt_app/pages/list_of_chats.dart';
import 'package:trial_evaluation_chatt_app/themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListOfChats(),
      theme: theme,
    );
  }
}

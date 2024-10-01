import 'package:flutter/material.dart';
import 'package:pcs3_sem5/pages/home.dart';
import 'package:pcs3_sem5/pages/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Папин Николай ЭФБО-02-22',
      theme: ThemeData(
      ),
      home: const Screen(),
    );
  }
}

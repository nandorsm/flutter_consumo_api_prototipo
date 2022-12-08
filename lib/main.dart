import 'package:consumindo_api/result_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Usuario',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ResultPage()
      //const HomePage(),
    );
  }
}

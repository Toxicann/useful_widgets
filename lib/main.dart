import 'package:flutter/material.dart';

import 'widgets/stepper_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        surface: const Color(0xff083409),
        brightness: Brightness.light,
      )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Map<String, dynamic>> itemList = [
    {"title": "User Details", "widget": const Text("User Details")},
    {"title": "Address", "widget": const Text("Address")},
    {"title": "Profession Details", "widget": const Text("Profession Details")},
    {"title": "Confirm Details", "widget": const Text("Confirm Details")},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StepperWidget(
        itemList: itemList,
      ),
    );
  }
}

import 'dart:developer';

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
        primary: const Color(0xff1c5f1e),
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
    {"title": "Personal Details", "widget": const Text("Personal Details")},
    {
      "title": "Professional Details",
      "widget": const Text("Professional Details")
    },
    {"title": "Address", "widget": const Text("Address")},
    {"title": "Confirm", "widget": const Text("Confirm")},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StepperWidget(
        itemList: itemList,
        onConfirm: () => log("confirmed!!"),
      ),
    );
  }
}

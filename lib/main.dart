import 'package:flutter/material.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const StepperWidget(),
    );
  }
}

class StepperWidget extends StatefulWidget {
  const StepperWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      onStepContinue: () {
        if (_index >= 3) return;
        setState(() {
          _index++;
        });
      },
      onStepCancel: () {
        if (_index <= 0) return;
        setState(() {
          _index--;
        });
      },
      onStepTapped: ((value) {
        setState(() {
          _index = value;
        });
      }),
      steps: const <Step>[
        Step(title: Text("User Details"), content: Text("test")),
        Step(title: Text("Address"), content: Text("test")),
        Step(title: Text("Profession Details"), content: Text("test")),
        Step(title: Text("Confirm"), content: Text("test")),
      ],
    );
  }
}

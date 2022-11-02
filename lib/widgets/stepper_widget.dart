import 'package:flutter/material.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int _index = 0;
  List<String> title = [
    "User Details",
    "Address",
    "Profession Details",
    "Confirm",
  ];
  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      onStepTapped: ((value) {
        setState(() {
          _index = value;
        });
      }),

      //if you donot want custom control buttons
      // onStepContinue: () {
      //   if (_index >= 3) return;
      //   setState(() {
      //     _index++;
      //   });
      // },
      // onStepCancel: () {
      //   if (_index <= 0) return;
      //   setState(() {
      //     _index--;
      //   });
      // },

      // however incase of custom buttons
      controlsBuilder: (context, details) {
        return Row(
          children: _index == 0
              ? [
                  TextButton(
                    onPressed: null,
                    child: Text("Next"),
                  )
                ]
              : [
                  TextButton(
                    onPressed: null,
                    child: Text("Next"),
                  ),
                  TextButton(
                    onPressed: null,
                    child: Text("Back"),
                  )
                ],
        );
      },
      //static
      // steps: const <Step>[
      //   Step(title: Text("User Details"), content: Text("test")),
      //   Step(title: Text("Address"), content: Text("test")),
      //   Step(title: Text("Profession Details"), content: Text("test")),
      //   Step(title: Text("Confirm"), content: Text("test")),
      // ],

      //dynamic as list of string
      steps: title.map((e) => Step(title: Text(e), content: Text(e))).toList(),
    );
  }
}

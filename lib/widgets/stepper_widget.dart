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
  // List<String> itemList = [
  //   "User Details",
  //   "Address",
  //   "Profession Details",
  //   "Confirm",
  // ];
  List<Map<String, dynamic>> itemList = [
    {"title": "User Details", "widget": const Text("User Details")},
    {"title": "Address", "widget": const Text("Address")},
    {"title": "Profession Details", "widget": const Text("Profession Details")},
    {"title": "Confirm Details", "widget": const Text("Confirm Details")},
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
              : _index > 0 && _index < itemList.length - 1
                  ? [
                      TextButton(
                        onPressed: null,
                        child: Text("Next"),
                      ),
                      TextButton(
                        onPressed: null,
                        child: Text("Back"),
                      )
                    ]
                  : [
                      TextButton(
                        onPressed: null,
                        child: Text("Confirm"),
                      ),
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
      // steps: itemList.map((e) => Step(title: Text(e), content: Text(e))).toList(),

      steps: itemList
          .map((item) =>
              Step(title: Text(item["title"]), content: item["widget"]))
          .toList(),
    );
  }
}

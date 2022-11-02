import 'package:flutter/material.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({Key? key, required this.itemList, this.onConfirm})
      : super(key: key);

  final List<Map<String, dynamic>> itemList;
  final VoidCallback? onConfirm;

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int _index = 0;

  void onStepContinue() {
    setState(() {
      _index++;
    });
  }

  void onStepCancel() {
    setState(() {
      _index--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      onStepTapped: ((value) {
        setState(() {
          _index = value;
        });
      }),
      controlsBuilder: (context, details) {
        return Row(
          children: _index == 0
              ? [continueTextButton("Next", onStepContinue)]
              : _index > 0 && _index < widget.itemList.length - 1
                  ? [
                      continueTextButton("Next", onStepContinue),
                      cancelTextButton("Back", onStepCancel),
                    ]
                  : [
                      continueTextButton("Confirm", widget.onConfirm),
                      cancelTextButton("Back", onStepCancel),
                    ],
        );
      },
      steps: widget.itemList
          .map((item) =>
              Step(title: Text(item["title"]), content: item["widget"]))
          .toList(),
    );
  }

  TextButton cancelTextButton(String title, VoidCallback? onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: const Text("Back"),
    );
  }

  TextButton continueTextButton(String title, VoidCallback? onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      child: Text(title),
    );
  }
}

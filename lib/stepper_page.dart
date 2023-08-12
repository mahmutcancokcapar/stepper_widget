import 'package:flutter/material.dart';

class StepperClass extends StatefulWidget {
  const StepperClass({super.key});

  @override
  State<StepperClass> createState() => _StepperClassState();
}

class _StepperClassState extends State<StepperClass> {
  int _currentStep = 0;
  void onStepTapped(int index) {
    setState(() {
      _currentStep = index;
    });
  }

  void onStepContinue() {
    setState(() {
      if (_currentStep < 3) {
        _currentStep++;
      }
    });
  }

  void onStepCancel() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stepper(
          currentStep: _currentStep,
          onStepTapped: onStepTapped,
          onStepContinue: onStepContinue,
          onStepCancel: onStepCancel,
          steps: [
            Step(
              isActive: _currentStep == 0,
              title: const Text('Step 1'),
              content: const Text('Açıklama 1'),
            ),
            Step(
              isActive: _currentStep == 1,
              title: const Text('Step 2'),
              content: const Text('Açıklama 2'),
            ),
            Step(
              isActive: _currentStep == 2,
              title: const Text('Step 3'),
              content: const Text('Açıklama 3'),
            ),
            Step(
              isActive: _currentStep == 3,
              title: const Text('Step 4'),
              content: const Text('Açıklama 4'),
            ),
          ],
          controlsBuilder: (context, details) {
            return Row(
              children: [
                const SizedBox(
                  height: 100,
                ),
                if (_currentStep < 3)
                  ElevatedButton(
                    onPressed: onStepContinue,
                    child: const Text('Bir Sonraki'),
                  )
                else
                  const ElevatedButton(
                    onPressed: null,
                    child: Text('Tamamlandı'),
                  ),
                const SizedBox(
                  width: 10,
                ),
                if (_currentStep > 0)
                  ElevatedButton(
                    onPressed: onStepCancel,
                    child: const Text('Bir Önceki'),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

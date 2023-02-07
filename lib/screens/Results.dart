import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/bmi_calculator_brain.dart';

class Results extends StatelessWidget {
  final String? bmiResult;
  final String? bmiText;
  final String? bmiInterpretation;

  Results(
      {required this.bmiResult,
      required this.bmiText,
      required this.bmiInterpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'BMI CALCULATOR',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Text(
              'Your Result',
              style: kTitleTextStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              onPressed: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiText!,
                    style: kResultsTextStyle,
                  ),
                  Text(
                    bmiResult!,
                    style: kBmiResultsTextStyle,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                    child: Text(
                      bmiInterpretation!,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onPressed: () {
              Navigator.pop(context);
            },
            label: 'RE-CALCULATE',
          )
        ],
      ),
    );
  }
}

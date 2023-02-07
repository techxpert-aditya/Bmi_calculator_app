import 'package:bmi_calculator/screens/Results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_button.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/bmi_calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
  none,
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  Gender selectedGender = Gender.none;

  double heightValue = 180;
  int weightValue = 60;
  int ageValue = 20;
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
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      iconContent: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      iconContent: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    onPressed: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              heightValue.toString(),
                              style: kNumericTextStyle,
                            ),
                            const Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0,
                            ),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 25.0),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbColor: const Color(0xFFEB1555),
                            overlayColor: const Color(0x29EB1555),
                          ),
                          child: Slider(
                            value: heightValue,
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                heightValue = newValue.round().toDouble();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    onPressed: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weightValue.toString(),
                          style: kNumericTextStyle,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weightValue++;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                RoundButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weightValue--;
                                    });
                                  },
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    onPressed: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          ageValue.toString(),
                          style: kNumericTextStyle,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      ageValue++;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                RoundButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      ageValue--;
                                    });
                                  },
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            label: 'CALCULATE',
            onPressed: () {
              BMICalculatorBrain brain =
                  BMICalculatorBrain(height: heightValue, weight: weightValue);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Results(
                    bmiResult: brain.getResults(),
                    bmiText: brain.getResultText(),
                    bmiInterpretation: brain.getResultFeedback(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

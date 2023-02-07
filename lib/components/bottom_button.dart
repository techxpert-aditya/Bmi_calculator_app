import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  BottomButton({required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: kBottomButtonColour,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            label,
            style: kBottomButtonTextStyle,
          ),
        ),
      ),
    );
  }
}

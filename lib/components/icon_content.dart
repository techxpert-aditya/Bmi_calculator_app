import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  final IconData? iconContent;
  final String label;

  IconContent({this.iconContent, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconContent,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}

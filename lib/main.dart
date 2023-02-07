import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import '../screens/Results.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF0a0d22),
        ),
        scaffoldBackgroundColor: const Color(0xFF0a0d22),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/results': (context) => Results(
              bmiResult: '',
              bmiText: '',
              bmiInterpretation: '',
            ),
      },
    );
  }
}

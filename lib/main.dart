import 'package:bmi_app/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Bmi_plus());
}

class Bmi_plus extends StatelessWidget {
  const Bmi_plus({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner:false,
      home:HomePage(),
    );  }
}
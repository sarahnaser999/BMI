// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bmi_app/Colors.dart';
import 'package:bmi_app/pages/control.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Gender(
              gendermale: 'Male',
              gendercolor: kblue,
              genderIcon: Icons.male,
              isMale: true,
            ),
            Gender(
              gendermale: 'Female',
              gendercolor: kred,
              genderIcon: Icons.female,
              isMale: false,
            ),
          ],
        ),
      ),
    );
  }
}

class Gender extends StatelessWidget {
  String gendermale;
  Color gendercolor;
  IconData genderIcon;
  bool isMale;
  Gender({
    Key? key,
    required this.gendermale,
    required this.gendercolor,
    required this.genderIcon,
    required this.isMale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: gendercolor),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Control(isMale: isMale)),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(genderIcon, color: Colors.white, size: 85),
              SizedBox(height: 16),
              Text(
                gendermale,
                style: TextStyle(color: Colors.white, fontSize: 38),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

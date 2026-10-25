// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';
import 'dart:math';

import 'package:bmi_app/Colors.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  int height;
  int weight;
  bool isMale;
  Result({
    Key? key,
    required this.height,
    required this.weight,
    required this.isMale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double bmiCalc = weight / pow(height / 100, 2);
    String result = '';
    switch (bmiCalc) {
      case < 16:
        result = " Servere Thinness";
        break;
      case > 18.5 && < 25:
        result = "Normal";
        break;
      case > 25 && < 30:
        result = "Overweight";
        break;
      case > 30:
        result = "obese";
        break;
      default:
    }

    return Scaffold(
      backgroundColor:isMale ? kblue : kred,
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  "Your Bmi Is :",
                  style: TextStyle(fontSize: 42, color: Colors.white),
                ),
                SizedBox(height:40,),
                 Text(
                  "${bmiCalc.toStringAsFixed(1)}",
                  style: TextStyle(fontSize: 42, color: Colors.white),
                ),
                SizedBox(height:40,),
                Text(
                  result,
                  style: TextStyle(fontSize: 42, color: Colors.white),
                ),
                SizedBox(height:40,),
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon:Icon(Icons.arrow_circle_left, color:Colors.white ,size:40,))

              ],
            ),
          ),
        ],
      ),
    );
  }
}

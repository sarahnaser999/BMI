// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bmi_app/pages/result.dart';
import 'package:flutter/material.dart';

import 'package:bmi_app/Colors.dart';

class Control extends StatefulWidget {
  bool isMale;
    Control({
    Key? key,
    required this.isMale,
  }) : super(key: key);

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  int weight = 35;
  int hight = 140;
  @override
  Widget build(BuildContext context) {
    Color kMainColor = widget.isMale ? kblue : kred;
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        SizedBox(height: 36),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: kMainColor,
                                  size: 26,
                                ),
                              ),

                              Text(
                                "BMI",
                                style: TextStyle(color: kMainColor, fontSize: 26),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                 widget.isMale ? "Male" : "Female", 
                                style: TextStyle(fontSize: 24)),
                              Icon(
                                widget.isMale ?
                                Icons.male : Icons.female, color: kMainColor, size: 120),
                              Text(
                                "Weight (Kg)",
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            itemCount: 30,
                            itemBuilder: (context, index) {
                              int i = (index + 5) * 5;
                              return Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      weight = i;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Center(
                                      child: Text(
                                        "$i",
                                        style: TextStyle(
                                          fontSize: weight == i ? 42 : 24,
                                          color: weight == i
                                              ? kMainColor
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(color: kMainColor),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        SizedBox(height: 48),
                        Text(
                          "Height \n (CM)",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            itemCount: 30,
                            itemBuilder: (context, index) {
                              int i = (index + 25) * 5;
                              return Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      hight = i;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: hight == i ? Colors.white : kMainColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "$i",
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: hight == i
                                              ? kMainColor
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            left: MediaQuery.sizeOf(context).width * 2 / 3 - 40,

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kyellow,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Result(height: hight, weight: weight, isMale:widget.isMale);

                },));
              },
              child: Row(
                children: [
                  Text("Calc".toUpperCase(),style:TextStyle(fontSize:22),),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

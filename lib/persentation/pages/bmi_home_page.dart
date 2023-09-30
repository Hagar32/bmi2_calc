import 'dart:math';

import 'package:bmi_calc/persentation/pages/result_page.dart';
import 'package:bmi_calc/persentation/widgets/bmi_home_content.dart';
import 'package:flutter/material.dart';


class BmiPage extends StatefulWidget {
  const BmiPage({Key? key}) : super(key: key);

  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  bool isMale = false;
  double height = 100;
  int weight = 60;
  int age = 15;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      backgroundColor: Colors.black45,
      body:  Column(
            children: [

              GenderWidget(
                isMale: isMale,
                onGenderChanged: (value) {
                  setState(() {
                    isMale = value;
                  });
                },
              ),

              Expanded(

                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),

                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                     color: Colors.blueGrey.shade900,
                    ),
                    width: double.infinity,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Height Widget
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(
                              'Height',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.round().toString(),
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              ' cm',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),

                        Slider(
                          activeColor: Colors.white,

                          thumbColor: Colors.pinkAccent,
                          value: height,
                          min: 100,
                          max: 220,
                          onChanged: (newValue) {
                            setState(() {
                              height = newValue;
                            });
                          },
                        ),
                        // Weight and Age Widgets
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Weight Widget
                              Expanded(

                                child:SingleChildScrollView (
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.blueGrey.shade800,
                                      ),
                                      child: IncrementDecrementButton(
                                        label: 'Weight',
                                        value: weight,
                                        onIncrement: () {
                                          setState(() {
                                            weight++;
                                          });
                                        },
                                        onDecrement: () {
                                          setState(() {
                                            weight--;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Age Widget
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.blueGrey.shade800,
                                      ),
                                      child: IncrementDecrementButton(
                                        label: 'Age',
                                        value: age,
                                        onIncrement: () {
                                          setState(() {
                                            age++;
                                          });
                                        },
                                        onDecrement: () {
                                          setState(() {
                                            age--;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ),
                      ],
                    ),
                  ),
                ),
              ),
              ActionButton(
                label: 'Calculate',
                onPressed: () {
                  double result = weight / pow(height / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BmiResult(
                        age: age,
                        isMale: isMale,
                        result: result.round(),
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

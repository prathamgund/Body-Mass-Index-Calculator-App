import 'package:bmi/bottom_button.dart';
import 'package:bmi/constant.dart';
import 'package:bmi/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
   final String bmi;
  final String bmiresult;
  final String interpretation;

  const ResultPage(this.bmi, this.bmiresult, this.interpretation, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
            child: const Text(
              'YOUR RESULT',
              style: TextStyle(
                fontSize: 46.0, 
                fontWeight: FontWeight.bold),
            ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              kActiveCardColor, 
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiresult, 
                    style: TextStyle(
                      fontSize: 25.0, 
                      color: Colors.greenAccent[700],
                      fontWeight: FontWeight.bold),
                      ),
                       Text(
                        bmi,
                        style: const TextStyle(
                          fontSize: 110.0, fontWeight: FontWeight.bold,
                        ),
                      ),
                       Text(
                        interpretation,
                        style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                      ),
                ],
              ),
            ),
          ),
          BottomButton('RE-CALCULATE', () {
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }
}
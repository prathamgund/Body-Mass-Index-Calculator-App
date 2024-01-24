import 'dart:math';

class BmiLogic {
  final int height;
  final int weight;

  BmiLogic(this.height, this.weight);

  late double bmi;

  String calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if(bmi < 18.4) {
      return 'UNDER WEIGHT' ;
    } else if (bmi < 24.9) {
      return 'NORMAL' ;
    } else {
      return 'OVER WEIGHT' ;
    } 
  }


 String interpretation() {
    if(bmi < 18.4) {
      return 'YOU HAVE A LOWER BMI. PLEASE EAT MORE.' ;
    } else if (bmi < 24.9) {
      return 'YOU HAVE A NORMAL BODY WEIGHT. GOOD JOB!' ;
    } else {
      return 'YOU HAVE HIGHER BODY WEIGHT. PLEASE EXERCISE MORE.' ;
    } 
  }
}
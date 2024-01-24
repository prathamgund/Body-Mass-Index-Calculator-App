import 'package:bmi/constant.dart';
import 'package:flutter/material.dart';



class BottomButton extends StatelessWidget {
  final String label;
  final Function() onPress;
  const BottomButton(this.label, this.onPress,{
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 60.0,
        width: double.infinity,
        color: kBottomCardColor,
        child: Center(
          child: Text(
            label, 
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

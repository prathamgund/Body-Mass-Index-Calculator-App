import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
 final Color color;
 final Widget childContent;
const ReusableCard(this.color, this.childContent, {super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    color: color,
    ),
    child: childContent,
  );
  }
}
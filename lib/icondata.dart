import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ReusableCardContent extends StatelessWidget {
  ReusableCardContent(@required this.cardicon, @required this.cardtext);

  final IconData cardicon;
  final String cardtext;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            cardicon,
            size: 80.0,
          ),
          SizedBox(height: 10,),
          Text(
            cardtext, style: kLabelTextStyle, 
          )
        ]);
  }
}
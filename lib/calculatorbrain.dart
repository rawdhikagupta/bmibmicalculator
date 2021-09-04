import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class CalculatorBrain{
  CalculatorBrain({@required this.height,@required this.weight});
  int height, weight;
  double _bmi;
  String bmi()
  {
    _bmi = weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }
  String result()
  {
    _bmi = weight/pow(height/100,2);
    if(_bmi>=25)
      return 'OVERWEIGHT';
    else if(_bmi>=18.5)
      return 'NORMAL';
    else
      return 'UNDERWEIGHT';
  }

  String resultinterpretation()
  {
    _bmi = weight/pow(height/100,2);
    if(_bmi>=25)
      return 'This is when you stop your daily visits to PizzaHut and KFC.';
    else if(_bmi>=18.5)
      return 'Congratulations, you\'re a healthy, sexy beast!';
    else
      return 'You could try eating something other than air.';
  }
  Color resultcolor()
  {
    _bmi = weight/pow(height/100,2);
    if(_bmi>=25)
      return Color(0xFFF57F17);
    else if(_bmi>=18.5)
      return Color(0xFF24D876);
    else
      return Colors.blueAccent;
  }
}
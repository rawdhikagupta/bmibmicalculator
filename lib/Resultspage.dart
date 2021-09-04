import 'package:bmi_calculator/ReusableCard.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/icondata.dart';
import 'package:flutter/material.dart';

class Resultspage extends StatelessWidget {
  Resultspage({this.bmi, this.results, this.interpretations, this.resultcolor });
  final String bmi, results, interpretations;
  final Color resultcolor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR',),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex:1,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Text('Your Result', style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),),
                  ),
                )),
            Expanded(
              flex: 6,
              child: ReusableCard(
                colour: kActivecardcolor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(results,style: TextStyle(
                      color: resultcolor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text(bmi, style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text('Normal range: 18.5 to 25 kg/m2', style: TextStyle(
                      fontSize: 18,

                    ),),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Text(interpretations, textAlign: TextAlign.center,style: TextStyle(
                        fontSize: 20.0,
                      ),),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                color: kBottombarcolor,
                height: kBottomcontainerheight,
                child: Center(
                    child: Text(
                      'RE-CALCULATE',
                      style: TextStyle(
                        letterSpacing: 5,
                      ),
                    )),
              ),
            )
          ],
        ));
  }
}

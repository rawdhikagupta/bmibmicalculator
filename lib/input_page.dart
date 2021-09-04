import 'package:bmi_calculator/Resultspage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'ReusableCard.dart';
import 'icondata.dart';
import 'constants.dart';
import 'calculatorbrain.dart';

enum Gendertype {
  male,
  female,
}
Gendertype gender;
int height = 180;
int weight = 60;
int age =18;
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color malecardcolor = kInactivecardcolor;
  Color femalecardcolor = kInactivecardcolor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          gender = Gendertype.male;
                        });
                      },
                      colour: (gender == Gendertype.male)
                          ? kActivecardcolor
                          : kInactivecardcolor,
                      cardchild:
                          ReusableCardContent(FontAwesomeIcons.mars, 'MALE')),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          gender = Gendertype.female;
                        });
                      },
                      colour: gender == Gendertype.female
                          ? kActivecardcolor
                          : kInactivecardcolor,
                      cardchild: ReusableCardContent(
                          FontAwesomeIcons.venus, 'FEMALE')),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kInactivecardcolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ]),
                  SliderTheme(
                    data:SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 24),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                       onChanged: (double newValue){
                          setState(() {
                            height=newValue.round();
                          });

                       },
                    ),
                  )],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(colour: kActivecardcolor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(), style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon:FontAwesomeIcons.minus,
                          onpressed: (){
                            setState(() {
                              weight--;
                            });
                          },),
                          SizedBox(width: 15,),
                          RoundIconButton(icon:FontAwesomeIcons.plus,
                            onpressed: (){
                              setState(() {
                                weight++;
                              });
                            },),
                        ],
                      )
                    ],

                  ),),
                ),
                Expanded(
                  child: ReusableCard(colour: kActivecardcolor,
                    cardchild:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(), style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon:FontAwesomeIcons.minus,
                              onpressed: (){
                                setState(() {
                                  age--;
                                });
                              },),
                            SizedBox(width: 15,),
                            RoundIconButton(icon:FontAwesomeIcons.plus,
                              onpressed: (){
                                setState(() {
                                  age++;
                                });
                              },),
                          ],
                        )
                      ],

                    ),),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
              });
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(context,
              MaterialPageRoute(builder: (context){
                return Resultspage(resultcolor: calc.resultcolor(),bmi: calc.bmi(),results: calc.result(),interpretations: calc.resultinterpretation(),);
              },
              ));
    },
            child: Container(
              width: double.infinity,
              color: kBottombarcolor,
              height: kBottomcontainerheight,
              child: Center(
                  child: Text(
                'CALCULATE YOUR BMI',
                style: TextStyle(
                  letterSpacing: 5,
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}
class RoundIconButton extends StatelessWidget {
  const RoundIconButton({this.icon, this.onpressed});
  final IconData icon;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed: onpressed,
        child:Icon(icon),
        shape: CircleBorder(),
        constraints: BoxConstraints(
          minHeight: 56,
          minWidth: 56,
        ),
        elevation: 6.0,
        fillColor: Color(0xFF111328));
  }
  }




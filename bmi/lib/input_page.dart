import 'package:bmi/bmi_logic.dart';
import 'package:bmi/bottom_button.dart';
import 'package:bmi/constant.dart';
import 'package:bmi/icon_content.dart';
import 'package:bmi/result_page.dart';
import 'package:bmi/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
 


  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = const Color (0xFF111328);
  Color femaleCardColor = const Color (0xFF111328);

  int height = 120;
  int weight = 40;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        maleCardColor = kActiveCardColor;
                        femaleCardColor = kInactiveCardColor;
                      });
                    },
                    child: ReusableCard(
                      maleCardColor,
                      const IconContent(FontAwesomeIcons.mars, 'MALE'),
                      ),
                  ),
                ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                        femaleCardColor = kActiveCardColor;
                        maleCardColor = kInactiveCardColor;
                      });
                  },
                  child: ReusableCard(
                   femaleCardColor, 
                  const IconContent(FontAwesomeIcons.venus, 'FEMALE'),
                      ),
                ),
              ),
              ],
            ),
          ),
           Expanded(
            child:ReusableCard(
              kActiveCardColor, 
               Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(), 
                        style: kNumberTextStyle,
                      ),
                      const Text('cm'),
                    ],
                  ),
                  SliderTheme(
                    data: const SliderThemeData(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 34.0),
                    ),
                    child: Slider(
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: kInactiveCardColor,
                      activeColor: kBottomCardColor,
                    value: height.toDouble(), 
                    onChanged:(value) {
                      setState(() {
                       height = value.round();
                      }); 
                    },
                    ),
                  ),
                ],
              ),
              ),
          ),
             Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ReusableCard(
                    kActiveCardColor, 
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                          ),
                           Text(
                            weight.toString(), 
                          style: kNumberTextStyle,
                          ), 
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                              IconButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                 weight--;
                                });
                              }
                              ),
                              const SizedBox(width: 15.0),
                              IconButton(FontAwesomeIcons.plus, () {
                                setState(() {
                                  weight++;
                                });
                              }
                              ),
                            ],
                          ),
                      ],
                    ),
                    ),
                  ),
               Expanded(
                child: ReusableCard(
                  kActiveCardColor, 
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kLabelTextStyle,
                          ),
                           Text(
                            age.toString(), 
                          style: kNumberTextStyle,
                          ), 
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                              IconButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  age--;
                                });
                              }),
                              const SizedBox(width: 15.0),
                              IconButton(FontAwesomeIcons.plus, () {
                                setState(() {
                                  age++;
                                });
                              }
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
              ),
              ],
            ),
          ),
        BottomButton('CALCULATE', () {
          BmiLogic bmiLogic = BmiLogic(height, weight);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ResultPage(
              bmiLogic.calculateBMI(), 
              bmiLogic.getResult(), 
              bmiLogic.interpretation(),
            )),
          );
        }),
        ],
      ),
    );
  }
}



class IconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPress;
  const IconButton(
    this.icon,
    this.onPress, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 2.0,
      constraints: const BoxConstraints(
        minWidth: 50.0, minHeight: 50.0),
      fillColor: const Color(0xFF4C4F5E),
      padding: const EdgeInsets.all(16.0),
      shape: const CircleBorder(),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}

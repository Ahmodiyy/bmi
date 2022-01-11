import 'package:bmi/component/calculation.dart';
import 'package:bmi/functionality/calculateBmi.dart';
import 'package:bmi/screen/resultPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../component/iconContent.dart';
import '../component/resuableCard.dart';
import '../component/constant.dart';
import '../component/rawRoundButton.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GenderEnum genderEnum = GenderEnum.MALE;
  int height = 180;
  int weight = 100;
  int age = 15;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text(widget.title)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuableCard(
                    cardChild: IconContent(
                      label: 'Male',
                      iconDate: FontAwesomeIcons.mars,
                    ),
                    colour: genderEnum == GenderEnum.MALE
                        ? activeColor
                        : inActiveColor,
                    onPress: () {
                      setState(() {
                        genderEnum = GenderEnum.MALE;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ResuableCard(
                    cardChild: IconContent(
                      label: 'Female',
                      iconDate: FontAwesomeIcons.venus,
                    ),
                    colour: genderEnum == GenderEnum.FEMALE
                        ? activeColor
                        : inActiveColor,
                    onPress: () {
                      setState(() {
                        genderEnum = GenderEnum.FEMALE;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ResuableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'HEIGHT',
                      style: KTextSyle,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          height.toString(),
                          style: KTextSyleWeight,
                        ),
                        Text(
                          'cm',
                          style: KTextSyle,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Slider(
                        value: height.toDouble(),
                        min: 180.0,
                        max: 300.0,
                        onChanged: (double newRange) {
                          setState(() {
                            height = newRange.round();
                          });
                        }),
                  )
                ],
              ),
              colour: activeColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'WEIGHT',
                            style: KTextSyle,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            weight.toString(),
                            style: KTextSyleWeight,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawRoundButton(
                                icon: FontAwesomeIcons.minus,
                                minusOrPlus: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RawRoundButton(
                                icon: FontAwesomeIcons.plus,
                                minusOrPlus: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    colour: activeColor,
                  ),
                ),
                Expanded(
                  child: ResuableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Age',
                            style: KTextSyle,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            age.toString(),
                            style: KTextSyleWeight,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawRoundButton(
                                icon: FontAwesomeIcons.minus,
                                minusOrPlus: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RawRoundButton(
                                icon: FontAwesomeIcons.plus,
                                minusOrPlus: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    colour: Color(0xFF1D1E33),
                  ),
                ),
              ],
            ),
          ),
          Calculation(
              cal: 'CALCULATE',
              nav: () {
                CalculateBmi calcutedBmi =
                    CalculateBmi(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ResultPage(
                      bmiText: calcutedBmi.calculateBmi(),
                      bmiInterpretation: calcutedBmi.getInterpretation(),
                      bmiResult: calcutedBmi.getResult(),
                    ),
                  ),
                );
              }),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

enum GenderEnum {
  MALE,
  FEMALE,
}

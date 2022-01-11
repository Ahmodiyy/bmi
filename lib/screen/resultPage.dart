import 'package:bmi/component/constant.dart';
import 'package:bmi/component/resuableCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi/component/calculation.dart';

class ResultPage extends StatefulWidget {
  late final String bmiText;
  late final String bmiResult;
  late final String bmiInterpretation;

  ResultPage({
    required this.bmiText,
    required this.bmiInterpretation,
    required this.bmiResult,
  });
  @override
  _ResultPageState createState() => _ResultPageState(
      bmiInterpretation: bmiInterpretation,
      bmiResult: bmiResult,
      bmiText: bmiText);
}

class _ResultPageState extends State<ResultPage> {
  late final String bmiText;
  late final String bmiResult;
  late final String bmiInterpretation;

  _ResultPageState({
    required this.bmiText,
    required this.bmiInterpretation,
    required this.bmiResult,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: KTextSyleTitle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ResuableCard(
              colour: activeColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiResult.toUpperCase(),
                    style: KTextSyleResuly,
                  ),
                  Text(
                    bmiText,
                    style:
                        TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmiInterpretation,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Calculation(
              cal: 'RE-CALCULATE',
              nav: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}

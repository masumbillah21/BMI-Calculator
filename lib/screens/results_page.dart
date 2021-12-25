import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ResultsPage extends StatelessWidget {
  final double bmiResult;
  final String resultText;
  final String interpretation;

  ResultsPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText,
                        style: kResultTextStyle,
                      ),
                      Text(
                        bmiResult.toString(),
                        style: kBMITextStyle,
                      ),
                      Expanded(
                        child: SfRadialGauge(axes: <RadialAxis>[
                          RadialAxis(
                              minimum: 10,
                              maximum: 40,
                              interval: 5,
                              ranges: <GaugeRange>[
                                GaugeRange(
                                    startValue: 10,
                                    endValue: 18.5,
                                    color: Colors.orange),
                                GaugeRange(
                                  startValue: 18.5,
                                  endValue: 24.9,
                                  color: Colors.green,
                                ),
                                GaugeRange(
                                  startValue: 25,
                                  endValue: 29.9,
                                  color: Colors.red,
                                ),
                                GaugeRange(
                                  startValue: 30,
                                  endValue: 39.9,
                                  color: Colors.red[900],
                                ),
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(value: bmiResult)
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    widget: Container(
                                        child: Text(bmiResult.toString(),
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold))),
                                    angle: 90,
                                    positionFactor: 0.5)
                              ])
                        ]),
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BottomButton(
              buttonText: 'RE-CALCULATE',
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InputPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

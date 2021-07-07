import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressCircle extends StatelessWidget {
  final double percentConcluido;

  const ProgressCircle({Key key, this.percentConcluido = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CircularPercentIndicator(
        animation: true,
        lineWidth: 15.0,
        radius: 130.0,
        animationDuration: 2000,
        percent: percentConcluido,
        center: Text(
          "${(percentConcluido * 100).toStringAsFixed(2)}%",
          style: TextStyle(fontSize: 25.0, color: Colors.white),
        ),
        progressColor: Colors.yellow,
      ),
    );
  }
}

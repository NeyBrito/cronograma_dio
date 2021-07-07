import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressListBar extends StatelessWidget {
  final double percentConcluido;

  const ProgressListBar({Key key, this.percentConcluido}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: LinearPercentIndicator(
        width: MediaQuery.of(context).size.width - 120,
        animation: true,
        lineHeight: 20.0,
        animationDuration: 2000,
        percent: percentConcluido,
        center: Text("${(percentConcluido * 100).toStringAsFixed(2)}%", style: TextStyle(color: Colors.black),),
        linearStrokeCap: LinearStrokeCap.roundAll,
        progressColor: Colors.yellow,
      ),
    );
  }
}

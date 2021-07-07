import 'package:flutter/material.dart';

class BackgroundBoxDecoration {

  static getBoxDecoration() {
    return BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black87,
            Colors.red[700],
            Colors.orange[700],
            Colors.yellow[900],
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 1.0),
          stops: [0.0, 0.4, 0.8, 1.0],
          tileMode: TileMode.clamp,
        ));
  }

}

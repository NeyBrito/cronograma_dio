import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {

  static const Map<int, Color> color = {
    50: Color.fromRGBO(255, 92, 87, .1),
    100: Color.fromRGBO(255, 92, 87, .2),
    200: Color.fromRGBO(252, 215, 52, .5),
    300: Color.fromRGBO(252, 215, 52, .8),
    400: Color.fromRGBO(255, 92, 87, .5),
    500: Color.fromRGBO(255, 92, 87, .6),
    600: Color.fromRGBO(255, 92, 87, .7),
    700: Color.fromRGBO(230, 81, 0, .8),
    800: Color.fromRGBO(255, 92, 87, .9),
    900: Color.fromRGBO(255, 92, 87, 1),
  };

  static const MaterialColor colorCustom = MaterialColor(0xFFFF5C57, color);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Meu Cronograma',
      theme: ThemeData(
        textSelectionColor: Colors.black12,
        appBarTheme: AppBarTheme(color: Colors.black87),
        primarySwatch: colorCustom,
        primaryColor: Color(0xFF808080),
        accentColor: colorCustom,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: colorCustom,
        accentColor: Colors.white,
        textSelectionColor: Colors.black,
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';

const appbarColor = Color(0xff183642);
const appBgColor = Color(0xffEAEAEA);
const appCardColor = Color(0xffEAEAEA);
const appSecondaryColor = Color(0xff73628A);

const personalDataTheme = TextStyle(
  fontFamily: "PTSansNarrow-Bold",
  color: Color.fromRGBO(115, 115, 115, 1),
);

const personalDataHeadingTheme = TextStyle(
  fontFamily: "PTSansNarrow-Bold",
  color: Colors.black,
);

const mediaDataTextTheme = TextStyle(
  fontFamily: "Pacifico-Regular",
  fontWeight: FontWeight.bold,
  color: Color.fromRGBO(192, 192, 192, 1),
);

const appLinearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.deepPurpleAccent,
      Colors.cyan,
    ]);

MaterialColor getColor(int r, int g, int b) {
  Map<int, Color> _Color = {
    50: Color.fromRGBO(r, g, b, .1),
    100: Color.fromRGBO(r, g, b, .2),
    200: Color.fromRGBO(r, g, b, .3),
    300: Color.fromRGBO(r, g, b, .4),
    400: Color.fromRGBO(r, g, b, .5),
    500: Color.fromRGBO(r, g, b, .6),
    600: Color.fromRGBO(r, g, b, .7),
    700: Color.fromRGBO(r, g, b, .8),
    800: Color.fromRGBO(r, g, b, .9),
    900: Color.fromRGBO(r, g, b, 1),
  };
  final rgb = r.toString() + g.toString() + b.toString();
  final strColor = "0xFF${rgb}";
  MaterialColor colorCustom = MaterialColor(int.parse(strColor), _Color);
  return colorCustom;
}

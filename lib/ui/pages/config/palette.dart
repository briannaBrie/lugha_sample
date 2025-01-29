import 'package:flutter/material.dart';

const PRIMARY = "primary";
const WHITE = "white";

const Map<String, Color> myColors = {
  // PINK: Color.fromRGBO(226, 115, 138, 1),
  //PRIMARY: Color.fromARGB(255, 188, 88, 124),
  PRIMARY: Color.fromARGB(255, 84, 56, 167),
  //PRIMARY: Colors.purple,
  WHITE: Colors.white,
};

class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xff5438A7,
    // 0xffBC587C, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff5438A7), //10%
      100: Color(0xffb74c3a), //20%
      200: Color(0xffa04332), //30%
      300: Color(0xff89392b), //40%
      400: Color(0xff733024), //50%
      500: Color(0xff5c261d), //60%
      600: Color(0xff451c16), //70%
      700: Color(0xff2e130e), //80%
      800: Color(0xff170907), //90%
      900: Color(0xff000000), //100%
    },
  );
}

import "package:flutter/material.dart";


abstract class Colorcomponents {  //dont want to change every blue thing each time so this changes all of them
  static const Color xBlue = Color.fromARGB(255,31,112,241);
  static const Color borderBlack = Colors.black45;
  // Getter
  static Color get getBlue => xBlue;

  static Color get getBlack => borderBlack;
  
}


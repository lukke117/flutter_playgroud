
import 'dart:math';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class HomePageLogic {
  final colorNotfier = ValueNotifier<Color>(Colors.purple.shade700);

  void changeBackgroundColor(){
    print('I was clicked.');
    final randomNumber = Random().nextInt(7);
    final myNewColor = colorList[randomNumber];

    colorNotfier.value = myNewColor;
  }
}
final colorList = <Color>[
  Colors.purple,
  Colors.white,
  Colors.orange,
  Colors.blue,
  Colors.red,
  Colors.pink,
  Colors.lightGreenAccent,
];
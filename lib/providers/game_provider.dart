import 'dart:math';

import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier{
  final diceList = [
    "images/dice-six-faces-one.png",
    "images/dice-six-faces-two.png",
    "images/dice-six-faces-three.png",
    "images/dice-six-faces-four.png",
    "images/dice-six-faces-five.png",
    "images/dice-six-faces-six.png",
  ];
  int index1 = 0, index2 = 0;
  Random random = Random.secure();

  rollTheDices(){
    index1 = random.nextInt(6);
    index2 = random.nextInt(6);
  }
}
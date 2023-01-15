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
  int index1 = 0, index2 = 0, sum = 0, count = 0, point = 0, win = 0, lose = 0;
  String status = '';
  Random random = Random.secure();
  bool hasGameStarted = false;
  bool hasGameStopped = false;

  rollTheDices(){
    index1 = random.nextInt(6);
    index2 = random.nextInt(6);
    sum = index1 + index2 + 2;
    hasGameStarted = true;
    count += 1;
  }

  checkResult() {
    if(count == 1){
      if(sum == 7 || sum == 11){
        status = 'You Win';
        win += 1;
        hasGameStopped = true;
      }
      if(sum == 2 || sum == 3 || sum == 12){
        status = 'You lose';
        lose += 1;
        hasGameStopped = true;
      }
      if(sum == 4 || sum == 5 || sum == 6 || sum == 8 || sum == 9 || sum == 10){
        point = sum;
      }
    }else{
      if(point == sum){
        status = 'You Win';
        win += 1;
        hasGameStopped = true;
      }
      if(sum == 7){
        status = "You lose";
        lose +=1;
        hasGameStopped = true;
      }
    }
  }

  reset(){
    index1 = 0;
    index2 = 0;
    sum = 0;
    point = 0;
    status = "";
    count = 0;
    hasGameStarted = false;
    hasGameStopped = false;
  }

}
import 'package:flutter/material.dart';

import '../UI/InputBox.dart';
import 'GregDate.dart';
import 'JulianDate.dart';
import 'ToDate.dart';



var inputDate;
var today = ToDate().toDate();
// var Greg = GregDate().gregDate(Julian);
// var Julian = JulianDate().julianDate(inputDate);
var answer;
var result;



// displayDate(String inputDate) =>
//     '${GregDate().gregDate(JulianDate().julianDate(inputDate))} = ${JulianDate().julianDate(inputDate)}';

class ConvertAnswer {
  var convertAnswer = dateController.value;
  //var convertAnswer = dateController.value.text;

  inputType(convertAnswer) {

    if (convertAnswer.isEmpty || convertAnswer == null) {
      answer = "Invalid Entry: $convertAnswer try again";
      print(answer);
      //Put logic here to update display
      //return answer;
    }
    else if (convertAnswer.text.allMatches("[0-9]{6}")) {
      result = GregDate().gregDate(convertAnswer);
      answer = "$result = $convertAnswer";
      //Put logic here to update display
      //return answer;
    }
    else if (convertAnswer.text.allMatches("[0-9, /]+")) {
      result = JulianDate().julianDate(convertAnswer);
      answer = "$convertAnswer = $result";
      //Put logic here to update display
      //return answer;
    }
    else {
      answer = "Invalid Entry: $convertAnswer try again";
      //Put logic here to update display
    }

    return answer;
  }
}


// public String inputType(String convertAnswer) {
//   convertAnswer = txt_enter.getText();
//   if (convertAnswer.chars().allMatch(Character::isWhitespace) || convertAnswer.chars().allMatch(Character::isSpaceChar) || convertAnswer.chars().allMatch(Character::isLetter) || convertAnswer.contains("\\p{Punct}[^/]+")) {
//     answer = "Invalid Entry: ";
//     System.out.println(answer);
//   } else if (convertAnswer.matches("[0-9]{6}")) {
//
//     result = javaDate(convertAnswer);
//     answer = result + " = " + convertAnswer;
//     resultDisplay.setText(answer);
//
//   } else if (convertAnswer.matches("[0-9, /]+")) {
//     result = julianDate(convertAnswer);
//     answer = convertAnswer + " = " + result;
//     resultDisplay.setText(answer);
//   } else {
//     answer = "Invalid Entry: ";
//     System.out.println(answer);
//   }
//   return answer;
// }
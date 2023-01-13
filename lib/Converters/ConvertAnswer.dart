import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../UI/InputBox.dart';
import '../main.dart';
import 'GregDate.dart';
import 'JulianDate.dart';
import 'LeapYear.dart';
import 'ToDate.dart';



//String? inputDate;
var today = ToDate().toDate();
// var Greg = GregDate().gregDate(Julian);
// var Julian = JulianDate().julianDate(inputDate);
//String? answer;
String? result;
var gregMatch = RegExp("[0-9]{6}");
var julianMatch = RegExp("[0-9, /]+");
//String inputDate = inputDate;

// Julian(inputDate) async {
//   await JulianDate().julianDate(inputDate);
// }
//
// Greg(inputDate) async {
//   await GregDate().dateSplit(inputDate);
// }


var convertAnswer = dateController.text;
// displayDate(String inputDate) =>
//     '${GregDate().gregDate(JulianDate().julianDate(inputDate))} = ${JulianDate().julianDate(inputDate)}';

class ConvertAnswer {

  //var convertAnswer = dateController.value.text;

  inputType(convertAnswer) {

    //print("convertAnswer ${convertAnswer}");
    print("Func Start - ConvertAnswer Line 43");

    if (convertAnswer == null) {
      answer = "Invalid Entry ";
      print('Not Null');
      //print(answer);
      //Put logic here to update display
      //return answer;
    }
    else if (gregMatch.hasMatch(convertAnswer)) {
      dateSplit(var inputDate) {
        inputDate = inputDate.toString();
        // Break down JDE date into individual pieces
        var currentYear = int.parse(DateFormat('yy').format(DateTime.now()));
        //var splitYear = inputDate.substring(1, 3);
        var splitYear = int.parse(inputDate.substring(1, 3));
        //var splitDay = inputDate.substring(3, inputDate.length);
        var splitDay = int.parse(inputDate.substring(3, inputDate.length));
        var lastDecade = int.parse(inputDate.substring(0, 2));

// Uses the current year to determine if our 2 digit date needs a 19 or 20 in the front
        convYear() {
          if (splitYear <= currentYear) {
            //var year = '20' + splitYear.toString();
            var year = '20${splitYear.toString()}';
            return int.parse(year);
          } else if (splitYear >= currentYear && lastDecade.toString() != "19") {
            var year = '20${splitYear.toString()}';
            return int.parse(year);
          }
          else {
            //var year = '19' + splitYear.toString();
            var year = '19${splitYear.toString()}';
            return int.parse(year);
          }
        }

        // Takes 3 digit day in year and converts it to formatted date time.
        convDate() {
          var dayOfYear = splitDay;
          var millisInADay = const Duration(days: 1).inMilliseconds; // 86400000
          var millisDayOfYear = dayOfYear * millisInADay;
          var millisecondsSinceEpoch =
              DateTime.utc(convYear()).millisecondsSinceEpoch;

          var dayOfYearDate = DateTime.fromMillisecondsSinceEpoch(
              (millisecondsSinceEpoch + millisDayOfYear));
          var result = dayOfYearDate;
          //var result = DateFormat('MM/dd/${convYear()}').format(dayOfYearDate);

          return result;
        }
        result = DateFormat('MM/dd/${convYear()}').format(convDate());

        print("Greg date exit $result");
        //return convDate();

      }
      dateSplit(convertAnswer);
      //result = dateSplit(convertAnswer);
      answer = "$result = $convertAnswer";
      //Put logic here to update display
      //return answer;
    }
    else if (julianMatch.hasMatch(convertAnswer)) {
      julianDate(String inputDate) {
/*
Hands off all calculations to other methods and just does the string interpolation
and returns to Appbody
 */

        List<String> convDate = inputDate.split('/');
        Map<String, dynamic> date = {
          'Day': convDate[1],
          'Month': convDate[0],
          'Year': convDate[2],
        };

        var stripYear = int.parse(date['Year']);
        var stripMonth = int.parse(date['Month']);
        var stripDay = int.parse(date['Day']);

// Finds the correct day of the year in 3 digit format exp: 049
        dayInYear() {
          var answer = DateTime.utc(stripYear, stripMonth, stripDay);
          var yearEnd = DateTime.utc(stripYear, 12, 31);
          var differenceDays = yearEnd.difference(answer).inDays;
          if (LeapYear().leapYear(stripYear) == true) {
            var numDays = 366 - differenceDays;
            if (numDays.toString().length < 3) {
              if (numDays.toString().length < 2) {
                var result = '00' + numDays.toString();
                return result;
              }
              var result = '0' + numDays.toString();
              return result;
            } else {
              var result = numDays.toString();
              return result;
            }
          } else {
            var numDays = 365 - differenceDays;
            if (numDays.toString().length < 3) {
              if (numDays.toString().length < 2) {
                var result = '00' + numDays.toString();
                return result;
              }
              var result = '0' + numDays.toString();
              return result;
            } else {
              var result = numDays.toString();
              return result;
            }
          }
        }

        StringBuffer sb = StringBuffer();
        sb.write('1');
        sb.write(stripYear.toString().substring(2, 4));
        sb.write(dayInYear());
        result = sb.toString();
        return result;
        // return sb.toString();
      }
      julianDate(convertAnswer);
      print("Julian Date Exit  $result");
      //result = julianDate(convertAnswer);
      answer = "$convertAnswer = $result";
      //Put logic here to update display
      //return answer;
    }
    // else {
    //   print("$convertAnswer - ConvertAnswer - else statement Line 166");
    //   answer = "$today = ${JulianDate().julianDate(today)}";
    // }
    // else {
    //   answer = "Invalid Entry ";
    //   print('Else');
    //   //Put logic here to update display
    // }

    return answer;
  }
}

class LeapYear {
  leapYear(int year) {
    if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0) == true) {
      return true;
    }else {
      return false;
    }
    // bool isLeapYear(int stripYear) =>
    //     (stripYear % 4 == 0 && (stripYear % 100 != 0 || stripYear % 400 == 0) == true);
    // print(isLeapYear);
    // return isLeapYear;
  }

}

class ToDate {
  String toDate() {
    var result = DateFormat('MM/dd/yyyy').format(DateTime.now()).toString();
    return result;
  }
// displayDate(String inputDate) =>
//     '${GregDate().gregDate(JulianDate().julianDate(inputDate))} = ${JulianDate().julianDate(inputDate)}';
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
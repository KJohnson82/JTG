import 'package:intl/intl.dart';

import '../main.dart';

// Gets todays date
var today = ToDate().toDate();

String? result;

//Regex to help detect input matching
var gregMatch = RegExp("[0-9]{6}");
var julianMatch = RegExp("[0-9, /]+");
var firstMatch = RegExp("[^0-9/]");

var convertAnswer = dateController.text;

class ConvertAnswer {
  inputType(convertAnswer) {
    if (convertAnswer == null) {
      answer = "Invalid Entry ";
      print("NULL");
    }
    else if (convertAnswer.length < 6 || firstMatch.hasMatch(convertAnswer)) {
      answer = "Invalid Entry";
      print("MISSING BRACKETS");
    }
//Converts Dates from 122001 to 01/01/2022
    else if (gregMatch.hasMatch(convertAnswer) && convertAnswer.startsWith('1') && convertAnswer.length == 6 ) {
      dateSplit(var inputDate) {
        inputDate = inputDate.toString();
        // Break down JDE date into individual pieces
        var currentYear = int.parse(DateFormat('yy').format(DateTime.now()));
        //var splitYear = inputDate.substring(1, 3);
        var splitYear = int.parse(inputDate.substring(1, 3));
        //var splitDay = inputDate.substring(3, inputDate.length);
        var splitDay = int.parse(inputDate.substring(3, inputDate.length));
        //Helps detect pre2000 years
        var lastDecade = int.parse(inputDate.substring(0, 2));
// Uses the current year to determine if our 2 digit date needs a 19 or 20 in the front
        convYear() {
          if (splitYear <= currentYear) {
            var year = '20${splitYear.toString()}';
            return int.parse(year);
          } else if (splitYear >= currentYear &&
              lastDecade.toString() != "19") {
            var year = '20${splitYear.toString()}';
            return int.parse(year);
          } else {
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

          return result;
        }

        result = DateFormat('MM/dd/${convYear()}').format(convDate());
      }

      dateSplit(convertAnswer);
      answer = "$result = $convertAnswer";
    }
//Converts Dates from 01/01/2022 to 122001
    else if (julianMatch.hasMatch(convertAnswer) && convertAnswer.length == 10 && convertAnswer.contains('/')) {
      julianDate(String inputDate) {
        //Breaks apart date into day, month, year
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

//Assembles the converted Date in JDE Julian format exp:122001
        StringBuffer sb = StringBuffer();
        sb.write('1');
        sb.write(stripYear.toString().substring(2, 4));
        sb.write(dayInYear());
        result = sb.toString();
        return result;
      }

      julianDate(convertAnswer);
      answer = "$convertAnswer = $result";
    } else {
      answer = "Invalid Entry ";
      print('Else');
    }

    return answer;
  }
}

class LeapYear {
  leapYear(int year) {
    if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0) == true) {
      return true;
    } else {
      return false;
    }
  }
}

class ToDate {
  String toDate() {
    var result = DateFormat('MM/dd/yyyy').format(DateTime.now()).toString();
    return result;
  }
}

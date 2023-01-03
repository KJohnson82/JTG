import 'dart:core';

import 'LeapYear.dart';

// Returns date in JDE Julian format like 123001
class JulianDate {
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
    return sb.toString();
  }
}

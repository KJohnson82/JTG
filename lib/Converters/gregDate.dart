import 'dart:core';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GregDate {
  gregDate(var inputDate) {
    // Break down JDE date into individual pieces
    var currentYear = int.parse(DateFormat('yy').format(DateTime.now()));
    var splitYear = int.parse(inputDate.substring(1, 3));
    var splitDay = int.parse(inputDate.substring(3, inputDate.length));

// Uses the current year to determine if our 2 digit date needs a 19 or 20 in the front
    convYear() {
      if (splitYear <= currentYear) {
        var year = '20' + splitYear.toString();
        return int.parse(year);
      } else {
        var year = '19' + splitYear.toString();
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
      var result = DateFormat('MM/dd/${convYear()}').format(dayOfYearDate);

      return result;
    }

    return convDate();
  }
}

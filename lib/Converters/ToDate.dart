import 'dart:core';
import 'package:intl/intl.dart';
import 'GregDate.dart';
import 'JulianDate.dart';

class ToDate {
  String toDate() {
    var result = DateFormat('MM/dd/yyyy').format(DateTime.now()).toString();
    return result;
  }
// displayDate(String inputDate) =>
//     '${GregDate().gregDate(JulianDate().julianDate(inputDate))} = ${JulianDate().julianDate(inputDate)}';
}

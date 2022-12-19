import 'dart:core';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'gregDate.dart';
import 'julianDate.dart';

// This does not work correctly, revisit when done with other methods

class ToDate {
  String toDate() {
    var result = DateFormat('MM/dd/yyyy').format(DateTime.now()).toString();
    return result;
  }
  displayDate(String inputDate) => '${GregDate().gregDate(JulianDate().julianDate(inputDate))} = ${JulianDate().julianDate(inputDate)}';
}


import 'dart:core';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// This does not work correctly, revisit when done with other methods
class ToDate {
  String toDate() {
    var result = DateFormat('MM/dd/yyyy').format(DateTime.now());
    return result;
  }
}

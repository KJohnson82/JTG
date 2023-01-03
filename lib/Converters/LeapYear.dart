import 'dart:core';

class LeapYear {
  leapYear(int year) {
    bool isLeapYear(int stripYear) =>
        (stripYear % 4 == 0 && (stripYear % 100 != 0 || stripYear % 400 == 0));
    return isLeapYear;
  }
}

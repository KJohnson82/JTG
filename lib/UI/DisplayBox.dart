import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Converters/ToDate.dart';
import '../main.dart';

var inputDate = ToDate().toDate();

// var today = ToDate().toDate();
// var Greg = GregDate().gregDate(Julian);
// var Julian = JulianDate().julianDate(inputDate);
// var inputdate;
//
//
//
// // displayDate(String inputDate) =>
// //     '${GregDate().gregDate(JulianDate().julianDate(inputDate))} = ${JulianDate().julianDate(inputDate)}';

class DisplayBox extends StatelessWidget {
  const DisplayBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 385,
      height: 75,
      padding: const EdgeInsets.fromLTRB(10, 14, 10, 9.5),
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 7),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: const Color(0xFFF9F5E0),
        border: Border.all(
          width: 1.5,
          color: Colors.blueGrey,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      alignment: Alignment.center,
      child: Text(
        displayDate(inputDate),
        style: GoogleFonts.robotoMono(
            textStyle: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w500,
          letterSpacing: .5,
          color: Colors.black45,
          shadows: [
            Shadow(
              color: Colors.grey.shade400,
              offset: const Offset(1, 0.5),
              blurRadius: 1,
            ),
          ],
        )),
      ),
    );
  }
}

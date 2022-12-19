import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jtg/Converters/toDate.dart';
import '../Converters/gregDate.dart';
import '../Converters/julianDate.dart';
import '../main.dart';
import 'appBody.dart';


class DisplayBox extends StatelessWidget {
  const DisplayBox({Key? key}) : super(key: key);

  String get inputDate => ToDate().toDate();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 385,
      height: 95,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 9.5),
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
        ToDate().displayDate(inputDate),
        //'${gregDate(julianDate(inputDate))} = ${julianDate(inputDate)}',
        style: GoogleFonts.robotoMono(
            textStyle: TextStyle(
              fontSize: 26,
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



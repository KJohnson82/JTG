import 'package:flutter/material.dart';
import '../Converters/gregDate.dart';
import '../Converters/julianDate.dart';
import 'appBody.dart';


class DisplayBox extends StatelessWidget {
  const DisplayBox({Key? key}) : super(key: key);

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
    );
  }
}

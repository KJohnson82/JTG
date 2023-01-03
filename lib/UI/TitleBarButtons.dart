//Windows Top Bar Buttons
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

final buttonColors = WindowButtonColors(
    normal: Colors.teal[400],
    mouseOver: Colors.teal,
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: const Color(0xFFF9F5E0),
    iconMouseOver: Colors.black);

final closeButtonColors = WindowButtonColors(
    normal: Colors.teal[400],
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: const Color(0xFFF9F5E0),
    iconMouseOver: Colors.black);

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MinimizeWindowButton(colors: buttonColors),
        const VerticalDivider(
          width: .75,
          color: Colors.transparent,
        ),
        //MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}

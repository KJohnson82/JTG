//import 'dart:html';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jtg/UI/displayBox.dart';
import 'package:jtg/UI/inputBox.dart';

//
//
// TRYING TO GET THE DISPLAY BOX TO BUILD CORRECTLY IN APP LAYOUT
//
//

var inputDate = DateFormat('MM/dd/yyyy').format(DateTime.now()).toString();

class AppBody extends StatelessWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JTG',
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
          Container(
                //
                // Background Colors and Sizing
                //
                //     width: 450,
                height: 300,
                    padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    decoration: const BoxDecoration(
                      color: Colors.lightBlueAccent,
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.blueGrey],
                        stops: [0, 4],
                        begin: AlignmentDirectional(0, -1.75),
                        end: AlignmentDirectional(0, 2),
                      ),
                    ),
                child: WindowTitleBarBox(
                  child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0 ),
                      color: Colors.teal[300],
                      child: Stack(
                        children: [
                      WindowTitleBarBox(
                      child: Stack(
                      alignment: Alignment.centerLeft,
                        children: [
                          Text(
                            "JTG",
                            textAlign: TextAlign.center,
                            textHeightBehavior: TextHeightBehavior(
                              leadingDistribution: TextLeadingDistribution.values[1],
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          //
                          //TOP BAR WINDOW BUTTONS
                          //
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(child: MoveWindow()),
                              const WindowButtons(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                      ),
                    ),
                    //
                    // DATE INPUT BOX AND CONVERT BUTTON
                    //
                    Row(
                      children:  const [
                        InputBox(),
                        ConvertButton(),

                      ],
                    )

                  ],
                ),
              ),
          ),
              //
              //DISPLAY DATE BOX
              //
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 50, 8, 8),
                child: DisplayBox(),
              ),
        ],
          ),
      ),
    ),
    );
  }
}


//Windows Top Bar Buttons
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

// Convert Button

class ConvertButton extends StatelessWidget {
  const ConvertButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // print(Text(dateController.text));
        // content: Text(dateController.text),

      },
      child: const Text(
        'CONVERT',

        // style: GoogleFonts.oswald(
        //   color: const Color(0xFFF9F5E0),
        //   fontSize: 16,
        //   letterSpacing: 0.75,
        // ),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(100, 45),
        maximumSize: const Size(100, 45),
        primary: const Color(0xFF26A69A),
        fixedSize: const Size(100, 45),
      ),
    );
  }
}


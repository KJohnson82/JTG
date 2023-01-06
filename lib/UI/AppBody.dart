import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jtg/Converters/ConvertAnswer.dart';
import 'package:jtg/main.dart';

import 'DisplayBox.dart';
import 'InputBox.dart';
import 'TitleBarButtons.dart';

class AppBody extends StatefulWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  final inputDate = dateController.value.text;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.pinkAccent,
        body: SafeArea(
            // maintainBottomViewPadding: true,
            // bottom: true,
            child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisSize: MainAxisSize.max,
          //verticalDirection: VerticalDirection.up,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 262,
                padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.blueGrey],
                    stops: [0, 4],
                    begin: AlignmentDirectional(0, -1.75),
                    end: AlignmentDirectional(0, 2),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      alignment: Alignment.center,
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      child: WindowTitleBarBox(
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            const Text(
                              'JTG',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                MoveWindow(),
                                const WindowButtons(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 30, 8, 20),
                      child: DisplayBox(),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(25, 10, 0, 10),
                          child: InputBox(),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  String answer = ConvertAnswer().inputType(inputDate);
                                  print(answer);
                                  displayDate(answer);
                                });
                              },
                              child: Text(
                                'CONVERT',
                                //style: Theme.of(context).textTheme.button,
                                style: GoogleFonts.oswald(
                                  color: const Color(0xFFF9F5E0),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              style: ButtonStyle(
                                fixedSize: Theme.of(context)
                                    .elevatedButtonTheme
                                    .style
                                    ?.fixedSize,
                                backgroundColor: Theme.of(context)
                                    .elevatedButtonTheme
                                    .style
                                    ?.backgroundColor,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

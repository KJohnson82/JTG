import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
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
  final inputDate = dateController.text;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 262,
                padding: const EdgeInsets.fromLTRB(0, 1, 0, 1),
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(133, 251, 244, 100),
                      Color.fromRGBO(1, 157, 146, 100)
                    ],
                    stops: [0, 4],
                    begin: AlignmentDirectional(0, -1.75),
                    end: AlignmentDirectional(0, 2),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      alignment: Alignment.center,
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      child: WindowTitleBarBox(
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            MoveWindow(),
                            const Text(
                              'J2G CONVERTER',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFF9F5E0),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                //MoveWindow(),
                                WindowButtons(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 25, 8, 15),
                      child: DisplayBox(),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 12),
                      child: Divider(
                        height: 5,
                        thickness: 2,
                        color: Colors.teal,
                      ),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(32, 10, 0, 8),
                          child: InputBox(),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          //Converts Answer on Button Press
                          child: ElevatedButton(
                              onPressed: () {
                                answer = ConvertAnswer()
                                    .inputType(dateController.text);
                                answerDate.value = answer.toString();
                                dateController.clear();
                              },
                              child: Text(
                                'CONVERT',
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

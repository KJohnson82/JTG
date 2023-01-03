import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import 'Converters/GregDate.dart';
import 'Converters/JulianDate.dart';
import 'Converters/ToDate.dart';
import 'UI/AppBody.dart';
import 'UI/DisplayBox.dart';
import 'UI/InputBox.dart';

var inputDate;

displayDate(String inputDate) =>
    '${GregDate().gregDate(JulianDate().julianDate(inputDate))} = ${JulianDate().julianDate(inputDate)}';

void main() {
  runApp(
    const JTG(),
  );

  // print(ToDate().toDate());
  // inputDate = today;

  doWhenWindowReady(() {
    const initialSize = Size(450, 300);
    appWindow.title = "J2G Converter";
    appWindow.minSize = initialSize;
    appWindow.maxSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class JTG extends StatefulWidget {
  const JTG({Key? key}) : super(key: key);

  @override
  _JTGState createState() => _JTGState();
}

class _JTGState extends State<JTG> {
  // void _updateDisplay() {
  //   setState(() {
  //     ToDate().displayDate(inputDate);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //return  MaterialApp(home: HomePageWidget(),);
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal[300],
        primarySwatch: Colors.cyan,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal[300],
          foregroundColor: Colors.white,
        ),
        // canvasColor: Colors.white24,
        // cardColor: Colors.white24,
        //backgroundColor: Colors.grey[300],
        //backgroundColor: Colors.pinkAccent,
        scaffoldBackgroundColor: Colors.white24,

        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          alignment: Alignment.center,
          fixedSize: MaterialStateProperty.all(const Size(115, 47)),
          backgroundColor: MaterialStateProperty.all(const Color(0xFF26A69A)),
        )),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Color(0xFFF9F5E0),
          ),
          bodyText2: TextStyle(color: Colors.black45),
          button: TextStyle(
            color: Color(0xFFF9F5E0),
            fontSize: 16,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
          ),
        ),
      ),
      home: const AppBody(),
      debugShowCheckedModeBanner: false,
    );
  }
}

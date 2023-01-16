import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:jtg/Converters/ConvertAnswer.dart';

import 'UI/AppBody.dart';

TextEditingController dateController = TextEditingController();
//Gets todays Date
var today = ConvertAnswer().inputType(ToDate().toDate());
String? answer = "$today";
//Updates the Display Box
ValueNotifier<String> answerDate = ValueNotifier(answer.toString());

void main() {
  runApp(
    const JTG(),
  );

  doWhenWindowReady(() {
    const initialSize = Size(450, 260);
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
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  //Various different Color themes, these are overriden in certain places in the code
  @override
  Widget build(BuildContext context) {
    //return  MaterialApp(home: HomePageWidget(),);
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
        primarySwatch: Colors.teal,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Color(0xFFF9F5E0),
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
          backgroundColor: MaterialStateProperty.all(Colors.teal),
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

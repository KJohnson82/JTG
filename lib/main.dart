
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'UI/appBody.dart';

void main() {
  runApp(
    const JTG(),
  );

  // doWhenWindowReady(() {
  //   const initialSize = Size(450, 300);
  //   appWindow.title = "J2G Converter";
  //   appWindow.minSize = initialSize;
  //   appWindow.maxSize = initialSize;
  //   appWindow.size = initialSize;
  //   appWindow.alignment = Alignment.center;
  //   appWindow.show();
  // });
}

class JTG extends StatefulWidget {
  const JTG({Key? key}) : super(key: key);

  @override
  _JTGState createState() => _JTGState();
}

class _JTGState extends State<JTG> {
  @override
  Widget build(BuildContext context) {
    //return  MaterialApp(home: HomePageWidget(),);
    return const MaterialApp(
      home: AppBody(),
      debugShowCheckedModeBanner: false,
    );
  }
}
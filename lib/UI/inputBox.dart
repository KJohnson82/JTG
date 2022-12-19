
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show FilteringTextInputFormatter, LengthLimitingTextInputFormatter, MaxLengthEnforcement;
import 'package:google_fonts/google_fonts.dart';
import 'package:jtg/Converters/gregDate.dart';
import 'package:jtg/Converters/julianDate.dart';
import 'package:jtg/main.dart';

import '../Converters/textFormatter.dart';
import '../Converters/toDate.dart';

var dateController = TextEditingController();

class InputBox extends StatefulWidget {
  const InputBox({Key? key}) : super(key: key);

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  final _inputKey = GlobalKey<FormState>();


  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.fromLTRB(20, 20, 25, 10),
      child: SizedBox(
        width: 250.00,
        height: 48.00,
        child: Center(
          child: TextField(
            key: _inputKey,
            inputFormatters: [
              //TextFormatter(sample: 'xx/xx/xxxx', separator: '/'),
              FilteringTextInputFormatter.allow(RegExp('[0-9/]')),
              LengthLimitingTextInputFormatter(10),
              FilteringTextInputFormatter.deny(RegExp('\n')),
            ],
            controller: dateController,
            textAlign: TextAlign.center,
            maxLines: 1,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              //floatingLabelAlignment: FloatingLabelAlignment.center,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                //floatingLabelStyle: const TextStyle(),
                alignLabelWithHint: true,
                filled: true,
                fillColor: const Color(0xFFF9F5E0),
                labelStyle: const TextStyle(
                  color: Colors.black45,
                ),
                labelText: '01/01/2022 or 122001',
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(width: 1.75, color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(6),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 3,
                      color: Colors.blueGrey,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(6),
                )),
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return "Please enter some text";
            //   }
            //   return null;
            // },
          ),
        ),
      ),
    );
  }
}

// Convert Button

class ConvertButton extends StatelessWidget {
  ConvertButton({Key? key}) : super(key: key);

  var inputDate = dateController.value.text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: () {
        if (inputDate.contains('/')) {
          var answer = JulianDate().julianDate(inputDate);
          ToDate().displayDate(answer);
        }
        else if (!inputDate.contains('/') && inputDate.length == 6) {
          var answer = GregDate().gregDate(inputDate);
        ToDate().displayDate(answer);
        }
        else {
        ToDate().displayDate(inputDate);
        }

      },
      child: Text(
        'CONVERT',

        style: GoogleFonts.oswald(
          color: Color(0xFFF9F5E0),
          fontSize: 16,
          letterSpacing: 0.75,
        ),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(100, 47),
        maximumSize: const Size(100, 47),
        primary: const Color(0xFF26A69A),
        fixedSize: const Size(100, 47),
      ),
    );
  }
}

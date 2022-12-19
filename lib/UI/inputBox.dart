
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show FilteringTextInputFormatter, LengthLimitingTextInputFormatter, MaxLengthEnforcement;

import '../Converters/textFormatter.dart';

class InputBox extends StatefulWidget {
  const InputBox({Key? key}) : super(key: key);

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  final _inputKey = GlobalKey<FormState>();

  var dateController = TextEditingController();
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
          child: TextFormField(
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter some text";
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}

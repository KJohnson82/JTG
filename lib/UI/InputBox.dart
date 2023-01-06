import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var dateController = TextEditingController();

class InputBox extends StatefulWidget {
  const InputBox({Key? key}) : super(key: key);

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: SizedBox(
        width: 250.00,
        height: 50.00,
        child: TextField(
          controller: dateController,
          inputFormatters: [
            //TextFormatter(sample: 'xx/xx/xxxx', separator: '/'),
            FilteringTextInputFormatter.allow(RegExp('[0-9/]')),
            LengthLimitingTextInputFormatter(10),
            FilteringTextInputFormatter.deny(RegExp('\n')),
          ],
          textAlign: TextAlign.center,
          maxLines: 1,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
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
                    width: 3, color: Colors.blueGrey, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(6),
              )),
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   dateController.dispose();
  //   super.dispose();
  // }
}

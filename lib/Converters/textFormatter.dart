import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class TextFormatter extends TextInputFormatter {

  final String sample;
  final String separator;


  TextFormatter({
    required this.sample,
    required this.separator,
  });

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    if (newValue.text.isNotEmpty) {
      if (newTextLength > 6) {
        return TextEditingValue(
          text: '${oldValue.text}$separator${newValue.text.substring(
              newValue.text.length - 1)}',
          selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1),
        );
      }
    }
    else if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > sample.length) return oldValue;
        if (newValue.text.length < sample.length &&
            sample[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text: '${oldValue.text}$separator${newValue.text.substring(
                newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
                offset: newValue.selection.end + 1),
          );
        }
      }
    }
    return newValue;
  }

}


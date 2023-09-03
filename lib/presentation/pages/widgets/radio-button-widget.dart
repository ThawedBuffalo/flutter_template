import 'package:flutter/material.dart';

class RadioButtonWidget extends StatelessWidget {
  RadioButtonWidget(
      {Key? key,
      required this.title,
      required this.optionValue,
      required this.optionsList,
      required this.onChanged})
      : super(key: key);

  Text title;
  List<String> optionsList = ['one', 'two','three'];
  String optionValue;
  Function(List<String>?)? onChanged;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: RadioListTile(
          title: title,
          contentPadding: const EdgeInsets.all(0.0),
          value: optionValue,
          groupValue: optionsList,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          dense: true,
          tileColor: Colors.deepPurple.shade50,
          onChanged: onChanged)
    );
  }
}

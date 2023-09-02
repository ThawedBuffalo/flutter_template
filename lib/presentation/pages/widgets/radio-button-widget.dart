import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/pages/widgets/radio-button-type-enum.dart';

import '../page-1/page-1.dart';

class RadioButtonWidget extends StatelessWidget {
  RadioButtonWidget(
      {Key? key,
      required this.title,
      required this.value,
      required this.selectedRadioButtonType,
      required this.onChanged})
      : super(key: key);

  Text title;
  RadioButtonTypeEnum value;
  RadioButtonTypeEnum? selectedRadioButtonType;
  Function(RadioButtonTypeEnum?)? onChanged;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: RadioListTile(
          title: title,
          contentPadding: const EdgeInsets.all(0.0),
          value: value,
          groupValue: selectedRadioButtonType,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          dense: true,
          tileColor: Colors.deepPurple.shade50,
          onChanged: onChanged)
    );
  }
}

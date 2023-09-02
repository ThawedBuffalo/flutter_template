import 'package:flutter/material.dart';

enum RadioButtonTypeEnum { EnumValue1, EnumValue2 }

class RadioButtonWidget extends StatelessWidget {
  RadioButtonWidget(
      {Key? key,
      required this.title,
      required this.value,
      required this.radioButtonTypeEnum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  String title;
  RadioButtonTypeEnum value;
  RadioButtonTypeEnum? radioButtonTypeEnum;
}

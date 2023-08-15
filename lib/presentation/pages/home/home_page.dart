import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_form.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return HomeForm();
  }
}

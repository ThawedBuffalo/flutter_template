import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_controls.dart';

class HomeForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return homeFormView();
  }
}

Widget homeFormView() {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.blue),
      title: const Text('Welcome!', style: TextStyle(color: Colors.blue)),
      backgroundColor: Colors.white,
      key: const Key('sign-in-title'),
    ),
    body: SafeArea(
      // child: buildBody(context)));
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(height: 30),
        Image.asset(
          'assets/images/Sabres.png',
          height: 150,
          width: 150,
        ),
        const SizedBox(height: 30),
        HomeControls()
      ]),
    ),
  );
}

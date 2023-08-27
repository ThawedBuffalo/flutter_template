import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.blue),
          title: const Text('Welcome!', style: TextStyle(color: Colors.blue)),
          backgroundColor: Colors.white,
          key: const Key('sign-in-title'),
        ),
        body: Center(
          // child: buildBody(context)));
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(height: 30),
            Image.asset(
              'assets/images/Sabres.png',
              height: 150,
              width: 150,
            ),
          ]),
        ));
  }
}
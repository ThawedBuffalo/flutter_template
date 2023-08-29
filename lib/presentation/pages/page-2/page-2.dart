import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  Page2({Key? key, required this.productName}) : super(key: key);

  String productName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.blue),
          title: const Text(productName),
          backgroundColor: Colors.white,
          key: const Key('sign-in-title'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.account_balance_outlined),
                title: Text(productName)
              )
            ],
          )
        )
    );
  }
}

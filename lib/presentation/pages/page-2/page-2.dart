import 'package:flutter/material.dart';

import '../../../domain/entities/product.dart';
class Page2 extends StatelessWidget {
  //Page2({Key? key, required this.product}) : super(key: key);
  Page2({Key? key}) : super(key: key);
  //Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.blue),
          title: const Text('Page 2- Details',
              style: TextStyle(color: Colors.blue)),
          backgroundColor: Colors.white,
          key: const Key('sign-in-title'),
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.account_balance_outlined),
                  title: Text("dummy"),
                  //title: Text(product.name),
                  //subtitle: Text(product.description),
                )
              ],
            )));
  }
}

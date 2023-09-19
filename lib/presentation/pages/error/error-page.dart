import 'package:flutter/material.dart';

import '../../../domain/entities/product.dart';

class ErrorPage extends StatelessWidget {
  //Page2({Key? key, required this.product}) : super(key: key);
  const ErrorPage({Key? key}) : super(key: key);
  //Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.blue),
          title: const Text('ERROR', style: TextStyle(color: Colors.blue)),
          backgroundColor: Colors.white,
          key: const Key('sign-in-title'),
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0), child: const Text('Error')));
  }
}

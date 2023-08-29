import 'package:flutter/material.dart';

import '../page-2/page-2.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  var _productName;
  final _productController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //
  //   _productController.addListener(_updateProductName);
  // }

  void _updateProductName() {
    setState(() {
      _productName = _productController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.blue),
          title: const Text('Page 1- Form', style: TextStyle(color: Colors.blue)),
          backgroundColor: Colors.white,
          key: const Key('sign-in-title'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [

              TextFormField(
                controller: _productController,
                decoration: const InputDecoration(
                  labelText: 'product name',
                  icon: Icon(Icons.verified_user_outlined),
                  border: OutlineInputBorder(),
                ),
              ),

              OutlinedButton(
                style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context){
                        return Page2(productName: _productName,);
                      },
                    )
                  );
                }, // onPressed
                child: const Text("Go To Form"),
              ),
            ],
          ),
        )

    );
  }
}

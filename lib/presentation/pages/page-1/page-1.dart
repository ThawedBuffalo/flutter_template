import 'package:flutter/material.dart';
import 'package:flutter_template/core/logging/custom_logger.dart';
import 'package:flutter_template/presentation/pages/widgets/text-form-widget.dart';

import '../page-2/page-2.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  var _productName;
  final _productController = TextEditingController();
  bool _checkBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.blue),
          title:
              const Text('Page 1- Form', style: TextStyle(color: Colors.blue)),
          backgroundColor: Colors.white,
          key: const Key('sign-in-title'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              TextFormWidget(
                widgetController: _productController,
                title: _productName,
                leadingIcon: Icons.ac_unit_outlined, //dynamic icon
              ),
              const SizedBox(height: 20.0),
              CheckboxListTile(
                value: _checkBox,
                title: const Text("Attribute"),
                onChanged: (value) {
                  setState(() {
                    _checkBox = value!;
                    CustomLogger.loggerNoStack.i('checkbox value: $_checkBox');
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const SizedBox(height: 20.0),
              OutlinedButton(
                style:
                    OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Page2(
                        productName: _productController.text,
                        checkboxValue: _checkBox,
                      );
                    },
                  ));
                }, // onPressed
                child: const Text("Submit"),
              ),
            ],
          ),
        ));
  }
}

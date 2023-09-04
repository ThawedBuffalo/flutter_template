import 'package:flutter/material.dart';
import 'package:flutter_template/core/logging/custom_logger.dart';
import 'package:flutter_template/presentation/pages/widgets/radio-button-widget.dart';
import 'package:flutter_template/presentation/pages/widgets/text-form-widget.dart';

import '../page-2/page-2.dart';

enum RadioButtonTypeEnum { option1, option2 }

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  _Page1State() {
    _dropDownSelection = _dropDownList[0];
  }

  String _productName = 'Product Name';
  String _productDescription = 'Description';
  final _productController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _checkBox = false;

  // define variables for radio button section
  List<String> optionsList = ['choice one', 'choice two', 'choice three'];
  int radioButtonGroupValue = 1;

  // define values for dropdown fields
  final _dropDownList = ["Small", "Medium", "Large", "Xlarge"];
  String? _dropDownSelection;

  final _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormWidget(
                  widgetController: _productController,
                  title: _productName,
                  leadingIcon: Icons.ac_unit_outlined, //dynamic icon
                ),
                const SizedBox(height: 20.0),
                TextFormWidget(
                  widgetController: _descriptionController,
                  title: _productDescription,
                  leadingIcon: Icons.shopping_bag_outlined, //dynamic icon
                ),
                const SizedBox(height: 20.0),
                // TODO- create generic external widget
                CheckboxListTile(
                  value: _checkBox,
                  title: const Text("Attribute"),
                  onChanged: (value) {
                    setState(() {
                      _checkBox = value!;
                      CustomLogger.loggerNoStack
                          .i('checkbox value: $_checkBox');
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    RadioButtonWidget(
                        title: Text(optionsList[0]),
                        value: 0,
                        groupValue: radioButtonGroupValue,
                        onChanged: (value) {
                          setState(() {
                            var selected = optionsList[value];
                            CustomLogger.loggerNoStack.i(
                                'user selected value- ->$value<-, item ->$selected<-');
                            radioButtonGroupValue = value;
                          });
                        }),
                    const SizedBox(
                      width: 5.0,
                    ),
                    RadioButtonWidget(
                        title: Text(optionsList[1]),
                        value: 1,
                        groupValue: radioButtonGroupValue,
                        onChanged: (value) {
                          setState(() {
                            var selected = optionsList[value];
                            CustomLogger.loggerNoStack.i(
                                'user selected value- ->$value<-, item ->$selected<-');
                            radioButtonGroupValue = value;
                          });
                        }),
                    // RadioButtonWidget(
                    //     title: Text(RadioButtonTypeEnum.option2.name),
                    //     value: RadioButtonTypeEnum.option2,
                    //     selectedRadioButtonType: _radioButtonTypeEnum,
                    //     onChanged: (val) {
                    //       setState(() {
                    //         CustomLogger.loggerNoStack.i('user selected- $val');
                    //         _radioButtonTypeEnum = val;
                    //       });
                    //     }),
                  ],
                ),
                const SizedBox(height: 20.0),
                DropdownButtonFormField(
                  value: _dropDownSelection,
                  items: _dropDownList
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _dropDownSelection = value as String;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.deepPurple,
                  ),
                  dropdownColor: Colors.deepPurple.shade50,
                  decoration: const InputDecoration(
                      labelText: "Options",
                      prefixIcon: Icon(Icons.account_balance),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20.0),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      minimumSize: const Size(200, 50)),
                  onPressed: () {
                    CustomLogger.loggerNoStack.i("INFO: just showing info...");
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Page2(
                            productName: _productController.text,
                            checkboxValue: _checkBox,
                          );
                        },
                      ));
                    }
                  }, // onPressed
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ));
  }
}

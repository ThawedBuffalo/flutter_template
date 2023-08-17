import 'package:flutter/material.dart';
import 'package:flutter_template/core/logging/custom_logger.dart';

class HomeControls extends StatefulWidget {
  const HomeControls({super.key});

  @override
  HomeControlsState createState() => HomeControlsState();
}

class HomeControlsState extends State<HomeControls> with InputValidationMixin {
  final formGlobalKey = GlobalKey<FormState>();
  String validIdInput = 'bogus';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formGlobalKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 50),
          TextFormField(
            decoration: const InputDecoration(
                filled: true,
                hintText: '<some value>',
                border: OutlineInputBorder(),
                fillColor: Colors.white),
            key: const Key('input-data'),
            validator: (inputData) {
              if (isValidInputData(inputData!)) {
                validIdInput = inputData;
                return null;
              } else {
                return "Enter valid input";
              }
            },
          ),
          const SizedBox(height: 50),
          SizedBox(
            height: 50,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: OutlinedButton(
                onPressed: () {
                  loginAction();
                },
                key: const Key('action-button'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.green)),
                child: const Text('<do something>',
                    style: TextStyle(color: Colors.white))),
          )
        ],
      ),
    );
  }

  void loginAction() {
    // TODO- fire submission event
    //context.read<AuthenticationBloc>().add(LoginSubmitted(userNameInput, userPasswordInput));
    // final authResult = context.read<AuthenticationBloc>().authUsecase(
    //     AuthParams(userName: userNameInput, password: userPasswordInput));

    CustomLogger.loggerNoStack.i('user entered: $validIdInput');

  }
}

mixin InputValidationMixin {

  // TODO- this validation just returns true, add details in implementation
  bool isValidInputData(String idInput) {
    return true;
  }
}


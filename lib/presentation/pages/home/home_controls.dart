import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeControls extends StatefulWidget {
  @override
  _HomeControlsState createState() => _HomeControlsState();
}

class _HomeControlsState extends State<HomeControls> {
  final formGlobalKey = GlobalKey<FormState>();
  String userNameInput = 'init';
  String userPasswordInput = 'init';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formGlobalKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 30),
          TextFormField(
            decoration: const InputDecoration(
                filled: true,
                hintText: 'ID',
                border: OutlineInputBorder(),
                fillColor: Colors.white),
            key: const Key('id-input'),
          ),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: OutlinedButton(
                onPressed: () {
                  loginAction();
                },
                key: const Key('action-button'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.green)),
                child: const Text('ACTION',
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
    // logger.i(authResult);
  }
}

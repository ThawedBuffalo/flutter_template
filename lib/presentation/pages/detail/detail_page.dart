import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  bool liked = false;

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => DetailPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          ListTile(
            title: Text("detail object 1"),
            trailing: IconButton(
              icon: liked
                  ? (Icon(Icons.favorite))
                  : (Icon(Icons.favorite_border)),
              onPressed: () {
                setState() => liked = !liked;
              },
            ),
          ),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_container/routes/routes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: RawMaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.trades);
        },
        child: Text('Get In there'),
      )),
    );
  }
}

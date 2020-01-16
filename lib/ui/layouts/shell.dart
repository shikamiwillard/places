import 'package:flutter/material.dart';
import 'package:flutter_container/ui/layouts/sidedrawer.dart';
import 'package:flutter_container/ui/layouts/topbar.dart';

class AppShell extends StatelessWidget{

  AppShell({Key key, @required this.widget,this.title}) : super(key : key);

  Widget widget;
  String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title),
      body: widget,
      drawer: appDrawer(context),
    );
  }
}
import 'package:flutter/material.dart';

Widget appBar (String title) => AppBar(
  title: Text(title, style: TextStyle(color: Colors.white)),
  brightness: Brightness.dark,
);
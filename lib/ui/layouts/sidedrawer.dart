import 'package:flutter/material.dart';

Widget appDrawer(BuildContext context) => Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Do something here
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Do something here
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );

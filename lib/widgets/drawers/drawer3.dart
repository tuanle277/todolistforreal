import 'package:flutter/material.dart';

class Drawer3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Text('Name drawer'),
            )
          ],
        ),
      ),
    );
  }
}

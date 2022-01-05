import 'package:flutter/material.dart';

class Drawer1 extends StatelessWidget {
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
              child: const Text(
                'Drawer Header 1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.add_to_photos_rounded,
              ),
              title: Text(
                'To Do',
              ),
              onTap: null,
            ),
            const ListTile(
              leading: Icon(
                Icons.account_circle,
              ),
              title: Text(
                'Name',
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: Text(
                'Settings',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

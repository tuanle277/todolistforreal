import 'package:flutter/material.dart';
import 'package:todolist/widgets/screens/different_to_do_screen.dart';
import 'package:todolist/widgets/screens/to_do_screen.dart';

import '../screens/different_to_do_screen.dart';
import '../screens/settings_screen.dart';

class MainDrawer extends StatefulWidget {
  String enteredName;
  String enteredTitlee;

  MainDrawer(this.enteredName, this.enteredTitlee,
      this.submitName); // VoidCallback clicked;

  // Drawer1(this.clicked);

  // Function showDialog;
  Function submitName;

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  String toDoDrawerText = 'To Do';

  String nameDrawerText = 'Name';

  String settingsDrawerText = 'Settings';

  String chosenCategory = '';

  final _nameController = TextEditingController();
  final _titleeController = TextEditingController();

  _showMyDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your name and title?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  showCursor: true,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    icon: Icon(Icons.text_fields),
                  ),
                  controller: _nameController,
                  onSubmitted: (_) => widget.submitName,
                ),
                TextField(
                  showCursor: true,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    icon: Icon(Icons.work),
                  ),
                  controller: _titleeController,
                  onSubmitted: (_) => widget.submitName,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text(
                'Confirm',
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                widget.submitName;
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

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
                'Main Drawer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(
                Icons.add_to_photos_rounded,
              ),
              title: Text(
                toDoDrawerText,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DifferentToDo(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ListTile(
              leading: const Icon(
                Icons.account_circle,
              ),
              title: Text(
                nameDrawerText,
              ),
              onTap: () {
                Navigator.pop(context);
                _showMyDialog();
              },
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(
                Icons.settings,
              ),
              title: Text(
                settingsDrawerText,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            Divider(
              color: Colors.teal[200],
              indent: 15,
              endIndent: 15,
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DifferentToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              right: 340,
              bottom: MediaQuery.of(context).size.height * 0.15,
            ),
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

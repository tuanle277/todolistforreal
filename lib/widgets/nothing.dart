import 'package:flutter/material.dart';

class Nothing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 15,
      ),
      child: Text(
        'Nothing to do yet!',
        style: TextStyle(
          fontFamily: 'QuickSand',
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

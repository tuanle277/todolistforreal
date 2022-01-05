import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.2,
              child: const Text(
                'Welcome',
                style: TextStyle(
                  fontFamily: 'GreatVibes',
                  fontSize: 65,
                ),
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ToDo {
  final String id;
  final String title;
  final String description;
  // final String howLong;
  // bool? isChecked;
  // Icon icon;
  Color backgroundColor;

  ToDo({
    required this.id,
    required this.title,
    required this.description,
    // required this.icon,
    // // required this.howLong,
    // required this.isChecked,
    required this.backgroundColor,
  });
}

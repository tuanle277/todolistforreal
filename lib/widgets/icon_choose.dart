// import 'package:flutter/material.dart';

// import '../models/drop_down_item.dart';

// class DropDownButton extends StatefulWidget {
//   Item initialItem;
//   Icon chosenIcon;
//   List<Item> listOfItems;

//   DropDownButton(
//       {required this.initialItem,
//       required this.chosenIcon,
//       required this.listOfItems});

//   @override
//   _DropDownButtonState createState() => _DropDownButtonState();
// }

// class _DropDownButtonState extends State<DropDownButton> {
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<Item>(
//       onChanged: (Item? value) {
//         setState(
//           () {
//             widget.initialItem = value!;
//           },
//         );
//         widget.chosenIcon = value!.icon;
//       },
//       value: widget.initialItem,
//       items: widget.listOfItems.map<DropdownMenuItem<Item>>(
//         (Item value) {
//           return DropdownMenuItem(
//             value: value,
//             child: Row(
//               children: [
//                 value.icon,
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   value.name,
//                 ),
//               ],
//             ),
//           );
//         },
//       ).toList(),
//     );
//   }
// }

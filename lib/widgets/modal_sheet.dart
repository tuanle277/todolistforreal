// import 'package:flutter/material.dart';

// import '../models/category_item.dart';

// class ModalSheet extends StatefulWidget {
//   TextEditingController titleController;
//   TextEditingController placeController;
//   Function submitData;
//   Item initialItem;
//   Icon chosenIcon;
//   List<Item> listOfItems;

//   ModalSheet(
//       {required this.chosenIcon,
//       required this.initialItem,
//       required this.listOfItems,
//       required this.placeController,
//       required this.submitData,
//       required this.titleController});

//   @override
//   _ModalSheetState createState() => _ModalSheetState();
// }

// class _ModalSheetState extends State<ModalSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 260,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Container(
//             padding: const EdgeInsets.all(10),
//             child: TextField(
//               textCapitalization: TextCapitalization.sentences,
//               decoration: const InputDecoration(
//                 labelText: 'What you want to do?',
//                 icon: Icon(Icons.text_fields),
//               ),
//               controller: widget.titleController,
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(10),
//             child: TextField(
//               textCapitalization: TextCapitalization.sentences,
//               decoration: const InputDecoration(
//                 labelText: 'Where?',
//                 icon: Icon(
//                   Icons.place,
//                 ),
//               ),
//               controller: widget.placeController,
//             ),
//           ),
//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 DropdownButton<CItem>(
//                   onChanged: (Item? value) {
//                     setState(
//                       () {
//                         widget.initialItem = value!;
//                       },
//                     );
//                     widget.chosenIcon = value!.icon;
//                   },
//                   value: widget.initialItem,
//                   items: widget.listOfItems.map<DropdownMenuItem<Item>>(
//                     (Item value) {
//                       return DropdownMenuItem(
//                         value: value,
//                         child: Row(
//                           children: [
//                             value.icon,
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               value.name,
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ).toList(),
//                 ),
//                 Container(
//                   height: 33,
//                   width: 140,
//                   child: ElevatedButton.icon(
//                     onPressed: () => widget.submitData(),
//                     icon: const Icon(
//                       Icons.upload,
//                     ),
//                     label: const Text(
//                       'Submit',
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

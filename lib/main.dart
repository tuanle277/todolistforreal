import 'package:flutter/material.dart';

import './models/to_do.dart';
import './models/background_item.dart';
import 'models/category_item.dart';
import './widgets/screens/create_task.dart';

import 'widgets/screens/to_do_screen.dart';

//to do list with where, with whom, incorporates notification, order, flashcard, time, contact
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Colors.teal[200],
        errorColor: Colors.red[300],
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'GreatVibes',
                ),
              ),
        ),
      ),
      title: 'to_do list app',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon chosenIcon = const Icon(Icons.ac_unit);
  Color backgroundColor = Colors.teal.shade200;

  BackgroundItem initialBackgroundItem = _listOfBackgroundItems.first;

  static final List<BackgroundItem> _listOfBackgroundItems = [
    BackgroundItem(
      'Urgent',
      Colors.red.shade100,
      Colors.red.shade400,
    ),
    BackgroundItem(
      'Mild Urgent',
      Colors.yellow.shade100,
      Colors.yellow.shade400,
    ),
    BackgroundItem(
      'Not Urgent',
      Colors.teal.shade100,
      Colors.teal.shade400,
    )
  ];

  static var colorChoosingArray = [false, false, false];

  var colorChoosingArrayColor = [
    colorChoosingArray[0] == false
        ? _listOfBackgroundItems[0].initialColor
        : _listOfBackgroundItems[0].chosenColor,
    colorChoosingArray[1] == false
        ? _listOfBackgroundItems[1].initialColor
        : _listOfBackgroundItems[1].chosenColor,
    colorChoosingArray[2] == false
        ? _listOfBackgroundItems[2].initialColor
        : _listOfBackgroundItems[2].chosenColor,
  ];

  void changeColorOnTap(int index, Color backgroundColorChosen) {
    // ignore: unrelated_type_exquality_checks
    if (colorChoosingArray.contains(true) == true) {
      setState() {
        colorChoosingArray[0] = false;
        colorChoosingArray[1] = false;
        colorChoosingArray[2] = false;
      }
    }
    if (colorChoosingArray[index] == true) {
      setState(() {
        colorChoosingArray[index] = false;
      });
    } else {
      setState(() {
        colorChoosingArray[index] = true;
      });
    }
    backgroundColor = backgroundColorChosen;
  }

  CategoryItem initialCategoryItem = _listOfCategoryItems.first;

  static final List<CategoryItem> _listOfCategoryItems = [
    CategoryItem(
      "Life",
      const Icon(Icons.umbrella),
    ),
    CategoryItem(
      "Study",
      const Icon(Icons.book),
    ),
    CategoryItem(
      "Work",
      const Icon(Icons.computer),
    ),
    CategoryItem(
      "Sport",
      const Icon(Icons.sports_volleyball),
    ),
    CategoryItem(
      "Play",
      const Icon(
        Icons.videogame_asset,
      ),
    )
  ];

  final List<ToDo> _listOfToDo = [];

  final _nameController = TextEditingController();
  final _titleeController = TextEditingController();

  String enteredName = 'Name';
  String enteredTitlee = 'Title';

  void _submitName() {
    if (_nameController.text.isEmpty && _titleeController.text.isEmpty) {
      return;
    }

    print('did it');

    enteredName = _nameController.text;
    enteredTitlee = _titleeController.text;
  }

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _submitData() {
    if (_titleController.text.isEmpty || _descriptionController.text.isEmpty) {
      return;
    }
    print('did it');
    final enteredTitle = _titleController.text;
    final enteredDescription = _descriptionController.text;
    bool? isChecked = false;

    _addNewToDo(
      enteredTitle,
      enteredDescription,
      backgroundColor,
      //  isChecked, chosenIcon, backgroundColor
    );

    // Navigator.push(context, MaterialPageRoute(builder: (context) =>  ToDoScreen(addNewElement: addNewElement, listOfToDo: listOfToDo, doneTd: doneTd)))
    // Navigator.pop(context);
  }

  void _addNewToDo(
      String title,
      String description,
      // bool? isChecked,
      //     Icon chosenIcon,
      Color backgroundColor) {
    final newTd = ToDo(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        backgroundColor: backgroundColor
        // icon: chosenIcon == const Icon(IconData(0xE037))
        //     ? _listOfCategoryItems.first.icon
        //     : chosenIcon,
        // // howLong: howLong,
        // isChecked: isChecked,
        // backgroundColor: backgroundColor == Colors.black
        //     ? _listOfBackgroundItems.first.iconColor
        //     : backgroundColor,
        );
    setState(
      () {
        _listOfToDo.add(newTd);
      },
    );
  }

  void _doneTd(int index) {
    setState(
      () {
        _listOfToDo.removeAt(index);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.white,
            content: Text(
              _listOfToDo.isNotEmpty
                  ? 'Congrats! you only have ${_listOfToDo.length.toString()} things left to do!'
                  : 'Congrats! You got everything done!',
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'times new roman',
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }

  Future<void> _addNewElement(BuildContext ctx) async {
    final toCreateTask = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateTaskScreen(
          colorChangingArrayColor: colorChoosingArrayColor,
          changeColorOnTap: changeColorOnTap,
          titleController: _titleController,
          submitData: _submitData,
          descriptionController: _descriptionController,
          listOfBackgroundItems: _listOfBackgroundItems,
          colorChoosingArray: colorChoosingArray,
        ),
      ),
    );

    backgroundColor = toCreateTask;
  }

  // DateTime _selectedDate = DateTime.now();

  // void _presentDatePicker() {
  //   showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2021),
  //     lastDate: DateTime.now(),
  //   ).then(
  //     (pickedDate) {
  //       if (pickedDate == null) {
  //         return;
  //       }
  //       setState(
  //         () {
  //           _selectedDate = pickedDate;
  //         },
  //       );
  //     },
  //   );
  // }

  //   showModalBottomSheet(
  //     enableDrag: true,
  //     isDismissible: true,
  //     context: ctx,
  //     isScrollControlled: true,
  //     builder: (_) {
  //       return SizedBox(
  //         height: MediaQuery.of(context).size.height * 0.2,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             Container(
  //               padding: const EdgeInsets.all(10),
  //               child: TextField(
  //                 showCursor: true,
  //                 textCapitalization: TextCapitalization.sentences,
  //                 decoration: const InputDecoration(
  //                   border: OutlineInputBorder(),
  //                   labelText: 'To do',
  //                   icon: Icon(Icons.text_fields),
  //                 ),
  //                 controller: _titleController,
  //                 onSubmitted: (_) => _submitData,
  //               ),
  //             ),
  //             // Container(
  //             //   padding: const EdgeInsets.all(10),
  //             //   child: TextField(
  //             //     textCapitalization: TextCapitalization.sentences,
  //             //     decoration: const InputDecoration(
  //             //       labelText: 'How long does it take?',
  //             //       icon: Icon(
  //             //         Icons.place,
  //             //       ),
  //             //     ),
  //             //     controller: _howLongController,
  //             //   ),
  //             // ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               children: <Widget>[
  //                 DropdownButton<CategoryItem>(
  //                   onChanged: (CategoryItem? value) {
  //                     initialCategoryItem = value!;
  //                     setState(
  //                       () {
  //                         initialCategoryItem;
  //                       },
  //                     );
  //                     chosenIcon = value.icon;
  //                   },
  //                   value: initialCategoryItem,
  //                   items: _listOfCategoryItems
  //                       .map<DropdownMenuItem<CategoryItem>>(
  //                     (CategoryItem value) {
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
  //                 DropdownButton<BackgroundItem>(
  //                   onChanged: (BackgroundItem? value) {
  //                     setState(
  //                       () {
  //                         initialBackgroundItem = value!;
  //                       },
  //                     );
  //                     backgroundColor = value!.iconColor;
  //                   },
  //                   value: initialBackgroundItem,
  //                   items: _listOfBackgroundItems
  //                       .map<DropdownMenuItem<BackgroundItem>>(
  //                     (BackgroundItem value) {
  //                       return DropdownMenuItem(
  //                         value: value,
  //                         child: Row(
  //                           children: [
  //                             CircleAvatar(
  //                               backgroundColor: value.iconColor,
  //                               radius: 13,
  //                               child: const Padding(
  //                                 padding: EdgeInsets.all(10),
  //                               ),
  //                             ),
  //                             const SizedBox(
  //                               width: 10,
  //                             ),
  //                             Text(
  //                               value.title,
  //                             ),
  //                           ],
  //                         ),
  //                       );
  //                     },
  //                   ).toList(),
  //                 ),
  //                 SizedBox(
  //                   height: 33,
  //                   width: 110,
  //                   child: ElevatedButton.icon(
  //                     onPressed: _submitData,
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
  //           ],
  //         ),
  //       );
  //       // GestureDetector(
  //       //   onTap: () {},
  //       //   child:
  //       //   behavior: HitTestBehavior.opaque,
  //       // );
  //     },
  //   );
  // }

  // final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  // final List<String> _chosenTile = ['To Do', 'Name', 'Settings'];

  // void onClicked(String clickedText) {
  //   setState(
  //     () {
  //       _drawerState[clickedText] = false;
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return ToDoScreen(
      // showDialog: _s,
      enteredName: enteredName,
      enteredTitlee: enteredTitlee,
      submitName: _submitName,
      addNewElement: _addNewElement,
      listOfToDo: _listOfToDo,
      // showSnackBar: _showSnackBar,s
      doneTd: _doneTd,
      // clicked: clicked,
    );
  }
}

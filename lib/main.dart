import 'package:flutter/material.dart';

import './models/to_do.dart';
import './models/background_item.dart';
import 'models/category_item.dart';

import './widgets/to_do_screen.dart';

//to do list with where, with whom, incorporates notification, order, flashcard, time, contact
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
  Color backgroundColor = Colors.black;

  BackgroundItem initialBackgroundItem = _listOfBackgroundItems.first;

  static final List<BackgroundItem> _listOfBackgroundItems = [
    BackgroundItem(
      'Urgent',
      Colors.red.shade200,
    ),
    BackgroundItem(
      'Mild Urgent',
      Colors.yellow.shade200,
    ),
    BackgroundItem(
      'Not Urgent',
      Colors.teal.shade200,
    )
  ];

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

  final _titleController = TextEditingController();
  final _howLongController = TextEditingController();

  void _submitData() {
    if (_titleController.text.isEmpty && _howLongController.text.isEmpty)
      return;

    final enteredTitle = _titleController.text;
    final enteredhowLong = _howLongController.text;
    bool? isChecked = false;

    _addNewToDo(
        enteredTitle, enteredhowLong, isChecked, chosenIcon, backgroundColor);

    Navigator.of(context).pop();
  }

  void _addNewToDo(String title, String howLong, bool? isChecked,
      Icon chosenIcon, Color backgroundColor) {
    final newTd = ToDo(
        id: DateTime.now().toString(),
        title: title,
        icon: chosenIcon == const Icon(Icons.ac_unit)
            ? _listOfCategoryItems.first.icon
            : chosenIcon,
        // howLong: howLong,
        isChecked: isChecked,
        backgroundColor: backgroundColor == Colors.black
            ? _listOfBackgroundItems.first.icon_color
            : backgroundColor);
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
                fontWeight: FontWeight.bold,
                fontFamily: 'times new roman',
                fontSize: 20,
              ),
            ),
          ),
        );
      },
    );
  }

  void _addNewElement(BuildContext ctx) {
    showModalBottomSheet(
      isDismissible: true,
      context: ctx,
      isScrollControlled: true,
      builder: (_) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  showCursor: true,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'To do',
                    icon: Icon(Icons.text_fields),
                  ),
                  controller: _titleController,
                  onSubmitted: (_) => _submitData,
                ),
              ),
              // Container(
              //   padding: const EdgeInsets.all(10),
              //   child: TextField(
              //     textCapitalization: TextCapitalization.sentences,
              //     decoration: const InputDecoration(
              //       labelText: 'How long does it take?',
              //       icon: Icon(
              //         Icons.place,
              //       ),
              //     ),
              //     controller: _howLongController,
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  DropdownButton<CategoryItem>(
                    onChanged: (CategoryItem? value) {
                      initialCategoryItem = value!;
                      setState(
                        () {
                          initialCategoryItem;
                        },
                      );
                      chosenIcon = value.icon;
                    },
                    value: initialCategoryItem,
                    items: _listOfCategoryItems
                        .map<DropdownMenuItem<CategoryItem>>(
                      (CategoryItem value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Row(
                            children: [
                              value.icon,
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                value.name,
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                  DropdownButton<BackgroundItem>(
                    onChanged: (BackgroundItem? value) {
                      setState(
                        () {
                          initialBackgroundItem = value!;
                        },
                      );
                      backgroundColor = value!.icon_color;
                    },
                    value: initialBackgroundItem,
                    items: _listOfBackgroundItems
                        .map<DropdownMenuItem<BackgroundItem>>(
                      (BackgroundItem value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: value.icon_color,
                                radius: 13,
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                value.title,
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                  SizedBox(
                    height: 33,
                    width: 110,
                    child: ElevatedButton.icon(
                      onPressed: _submitData,
                      icon: const Icon(
                        Icons.upload,
                      ),
                      label: const Text(
                        'Submit',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
        // GestureDetector(
        //   onTap: () {},
        //   child:
        //   behavior: HitTestBehavior.opaque,
        // );
      },
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return ToDoScreen(
      addNewElement: _addNewElement,
      listOfToDo: _listOfToDo,
      // showSnackBar: _showSnackBar,
      doneTd: _doneTd,
      clicked: clicked,
    );
  }
}

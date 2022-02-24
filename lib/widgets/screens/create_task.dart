import 'package:flutter/material.dart';

import 'package:todolist/models/background_item.dart';
import '/models/background_item.dart';

class CreateTaskScreen extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final Function changeColorOnTap;

  Color backgroundColor;

  List<BackgroundItem> listOfBackgroundItems;
  final List colorChoosingArray;

  final List colorChangingArrayColor;

  final Function submitData;

  CreateTaskScreen(
      {required this.colorChoosingArray,
      required this.backgroundColor,
      required this.titleController,
      required this.colorChangingArrayColor,
      required this.changeColorOnTap,
      required this.submitData,
      required this.descriptionController,
      required this.listOfBackgroundItems});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  static List<bool> colorChoosingArray = [false, false, false];
  Color backgroundColor = Colors.teal.shade100;

  void resetBorder() {
    setState(() {
      colorChoosingArray[0] = false;
      colorChoosingArray[1] = false;
      colorChoosingArray[2] = false;
    });
  }

  void changeColorOnTap(int index) {
    // ignore: unrelated_type_equality_checks
    if (colorChoosingArray.contains(true)) {
      setState(() {
        colorChoosingArray[0] = false;
        colorChoosingArray[1] = false;
        colorChoosingArray[2] = false;
        colorChoosingArray[index] = true;
      });
    } else if (colorChoosingArray[index] == true) {
      setState(() {
        colorChoosingArray[index] = false;
      });
    } else {
      setState(() {
        colorChoosingArray[index] = true;
      });
    }
    print(colorChoosingArray[index]);
    print(widget.colorChangingArrayColor[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Stack(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(
                              50,
                            ),
                            bottomRight: Radius.circular(
                              50,
                            ),
                          ),
                          color: Colors.teal[200]),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height + 100,
                    ),
                    const SizedBox(height: 130),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // padding: EdgeInsets.only(
                    //   right: 340,
                    //   bottom: MediaQuery.of(context).size.height * 0.1,
                    // ),
                    IconButton(
                      padding: const EdgeInsets.only(
                        left: 5,
                        top: 25,
                      ),
                      iconSize: 25,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 18,
                      ),
                      child: Text(
                        "Create new task",
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 15,
                      ),
                      child: TextField(
                        showCursor: true,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          labelText: 'Title',
                        ),
                        controller: widget.titleController,
                        onSubmitted: (_) => widget.submitData,
                      ),
                    ),
                    // ],
                    Container(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 15,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              showCursor: true,
                              textCapitalization: TextCapitalization.sentences,
                              decoration: const InputDecoration(
                                labelText: 'Title',
                              ),
                              controller: widget.titleController,
                              onSubmitted: (_) => widget.submitData,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Icon(Icons.calendar_today),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    const CircleBorder()),
                                padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 18,
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.amber[500]), // <-- Button color
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                  (states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return Colors.teal[200];
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.16,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(30),
                            onTap: () {
                              backgroundColor =
                                  widget.listOfBackgroundItems[0].initialColor;
                              changeColorOnTap(0);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 5,
                                  color: colorChoosingArray[0] == false
                                      ? widget
                                          .listOfBackgroundItems[0].initialColor
                                      : widget
                                          .listOfBackgroundItems[0].chosenColor,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(300),
                                ),
                                color: widget
                                    .listOfBackgroundItems[0].initialColor,
                              ),
                              child: const Text(
                                'Urgent',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              alignment: Alignment.center,
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 5,
                                  color: colorChoosingArray[1] == false
                                      ? widget
                                          .listOfBackgroundItems[1].initialColor
                                      : widget
                                          .listOfBackgroundItems[1].chosenColor,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(300),
                                ),
                                color: widget
                                    .listOfBackgroundItems[1].initialColor,
                              ),
                              child: const Text(
                                'Mild urgent',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            onTap: () {
                              backgroundColor =
                                  widget.listOfBackgroundItems[1].initialColor;
                              changeColorOnTap(1);
                            },
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              alignment: Alignment.center,
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 5,
                                  color: colorChoosingArray[2] == false
                                      ? widget
                                          .listOfBackgroundItems[2].initialColor
                                      : widget
                                          .listOfBackgroundItems[2].chosenColor,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(300),
                                ),
                                color: widget
                                    .listOfBackgroundItems[2].initialColor,
                              ),
                              child: const Text(
                                'Not urgent',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            onTap: () {
                              backgroundColor =
                                  widget.listOfBackgroundItems[2].initialColor;
                              changeColorOnTap(2);
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        left: 16,
                        right: 16,
                      ),
                      child: TextField(
                        showCursor: true,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          labelText: 'Description',
                        ),
                        controller: widget.descriptionController,
                        onSubmitted: (_) => widget.submitData,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.9,
                left: MediaQuery.of(context).size.width * 0.26,
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.5,
                      color: Colors.black,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(300),
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: RawMaterialButton(
                    child: const Text(
                      'Add task',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      widget.submitData();
                      setState(
                        () {
                          widget.descriptionController.text = '';
                          widget.titleController.text = '';
                        },
                      );
                      resetBorder();
                      Navigator.pop(
                        context,
                        backgroundColor,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

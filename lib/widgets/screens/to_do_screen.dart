import 'package:flutter/material.dart';

import '../nothing.dart';
import '../list_of_to_do.dart';
import '../drawers/main_drawer.dart';

import '../../models/to_do.dart';

class ToDoScreen extends StatefulWidget {
  final Function addNewElement;
  final List<ToDo> listOfToDo;
  // Function showSnackBar;
  final String enteredName;
  final String enteredTitlee;
  final Function submitName;
  final Function doneTd;
  // final Function showDialog;
  // VoidCallback onClicked;
  // String chosenTile;

  ToDoScreen({
    required this.addNewElement,
    required this.listOfToDo,
    required this.enteredName,
    required this.enteredTitlee,
    // required this.showSnackBar,
    required this.doneTd,
    required this.submitName,
    // required this.showDialog,
    // required this.clicked,
    // required this.onClicked,
    // required this.chosenTile
  });

  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

//  Widget _changeDrawer (String chosenTile) {
//  switch(chosenTile) {
//         case 'To Do': Drawer2();
//          break;
//         case 'Name': Drawer3();
//           break;
//         case 'Settings': Drawer4();
//           break;
//         default:  Drawer1();
//           break;
//       };
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      drawer: MainDrawer(
        widget.enteredName, widget.enteredTitlee,
        // widget.showDialog,
        widget.submitName,
      ),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'To-do list',
          style: TextStyle(
            fontFamily: 'QuickSand',
            fontWeight: FontWeight.bold,
          ),
        ),
        // leading: IconButton(
        //   onPressed: () => _addNewElement(context),
        //   icon: const Icon(Icons.add),
        // ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 130,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(300),
          ),
          color: Colors.teal[300],
        ),
        child: RawMaterialButton(
          child: const Text(
            'Add To Do',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => widget.addNewElement(context),
        ),
      ),
      body: Stack(
        children: <Widget>[
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       fit: BoxFit.fill,
          //       image: AssetImage(
          //         "assets/images/background 6.png",
          //       ),
          //     ),
          //   ),
          // ),

          Stack(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.28,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(
                            60,
                          ),
                          bottomRight: Radius.circular(
                            60,
                          ),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.teal.shade600,
                            Colors.green.shade400,
                          ],
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height + 100,
                    ),
                    const SizedBox(height: 130),
                  ],
                ),
              ),
              Positioned(
                top: 85,
                left: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      padding: const EdgeInsets.only(
                        right: 80,
                        top: 5,
                      ),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              // color: Colors.black,
                              alignment: Alignment.center,
                              child: Flexible(
                                child: Text(
                                  widget.enteredName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontFamily: 'cambria',
                                    letterSpacing: 0.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: Text(
                              widget.enteredTitlee,
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'cambria',
                                letterSpacing: 0.8,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        'assets/images/profile.jpeg',
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  widget.listOfToDo.isEmpty
                      ? LayoutBuilder(
                          builder: (ctx, constraint) {
                            return Column(
                              children: <Widget>[
                                const SizedBox(height: 70),
                                Nothing()
                              ],
                            );
                          },
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.70,
                          child: ListOfToDo(
                            widget.listOfToDo,
                            // widget.showSnackBar,
                            widget.doneTd,
                          ),
                        ),
                ],
              )
            ],
          ),
          GestureDetector(
            child: Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
              child: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 27,
              ),
            ),
            onTap: () {
              _scaffoldState.currentState?.openDrawer();
            },
          ),
        ],
      ),
    );
  }
}

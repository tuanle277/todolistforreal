import 'package:flutter/material.dart';
import 'package:todolist/widgets/drawer1.dart';

import './welcome.dart';
import './nothing.dart';
import './list_of_to_do.dart';
import 'drawer1.dart';
import 'drawer2.dart';

import '../models/to_do.dart';

class ToDoScreen extends StatefulWidget {
  Function addNewElement;
  List<ToDo> listOfToDo;
  // Function showSnackBar;
  Function doneTd;
  bool clicked;

  ToDoScreen(
      {required this.addNewElement,
      required this.listOfToDo,
      // required this.showSnackBar,
      required this.doneTd,
      required this.clicked});

  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      drawer: widget.clicked ? Drawer1() : Drawer2(),
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: const Text('To-do list',
      //       style: TextStyle(
      //         fontFamily: 'QuickSand',
      //         fontWeight: FontWeight.bold,
      //       )),
      //   leading: IconButton(
      //     onPressed: () => _addNewElement(context),
      //     icon: const Icon(Icons.add),
      //   ),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 180,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(300),
          ),
          color: Colors.teal[200],
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
                height: MediaQuery.of(context).size.height * 0.4,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height + 100,
                      color: Colors.teal[100],
                    ),
                    const SizedBox(height: 130),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  const SizedBox(
                    height: 250,
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
                          height: MediaQuery.of(context).size.height * 0.67,
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
              padding: const EdgeInsets.all(20),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.teal[200],
                child: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 24,
                ),
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

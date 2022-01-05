import 'package:flutter/material.dart';

import '../models/to_do.dart';

class ListOfToDo extends StatefulWidget {
  final List<ToDo> _listOfToDo;
  final Function _doneTd;

  const ListOfToDo(this._listOfToDo, this._doneTd);
  @override
  _ListOfToDoState createState() => _ListOfToDoState();
}

class _ListOfToDoState extends State<ListOfToDo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Container(
        //   width: MediaQuery.of(context).size.width,
        //   padding: const EdgeInsets.symmetric(
        //     horizontal: 11,
        //     vertical: 4.5,
        //   ),
        //   child: const Text(
        //     'Physics',
        //     textAlign: TextAlign.center,
        //     style: TextStyle(
        //       fontSize: 20,
        //       fontFamily: 'Helvetia',
        //     ),
        //   ),
        // ),
        Expanded(
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2.5,
                  ),
                  child: InkWell(
                    child: Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(200),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 12,
                                  left: 12,
                                  bottom: 8,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    color: widget
                                        ._listOfToDo[index].backgroundColor),
                                height: 16,
                                width: 100,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 9),
                                padding: const EdgeInsets.all(2),
                                width: 230,
                                child: Text(
                                  widget._listOfToDo[index].title,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                    fontFamily: 'Quicksand',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 21,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: FittedBox(
                                      child: widget._listOfToDo[index].icon,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Theme.of(context).errorColor,
                                  ),
                                  onPressed: () => widget._doneTd(index),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              // Row(children: <Widget>[],)
              //       title: Container(
              //         padding: const EdgeInsets.symmetric(vertical: 7),
              //         alignment: Alignment.bottomLeft,
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: <Widget>[
              //             Container(
              //               alignment: Alignment.center,
              //               decoration: BoxDecoration(
              //                   borderRadius: const BorderRadius.all(
              //                     Radius.circular(20),
              //                   ),
              //                   color:
              //                       widget._listOfToDo[index].backgroundColor),
              //               height: 12.5,
              //               width: 64,
              //             ),
              //             Container(
              //               padding: const EdgeInsets.all(4),
              //               child: Text(
              //                 widget._listOfToDo[index].title,
              //                 style: const TextStyle(
              //                   color: Colors.black,
              //                   // fontWeight: FontWeight.bold,
              //                   fontSize: 18,
              //                 ),
              //               ),
              //             ),
              //             // Text(
              //             //   'This takes ${widget._listOfToDo[index].howLong}',
              //             //   style: const TextStyle(
              //             //     color: Colors.black54,
              //             //     fontSize: 14,
              //             //     fontFamily: 'times new roman',
              //             //   ),
              //             // ),
              //           ],
              //         ),
              //       ),
              //       value: widget._listOfToDo[index].isChecked,
              //       onChanged: (bool? value) {
              //         setState(
              //           () {
              //             widget._listOfToDo[index].isChecked = value;
              //           },
              //         );
              //       },
              //       // secondary: Wrap(
              //       //   spacing: -10,
              //       //   children: <Widget>[
              //       //     CircleAvatar(
              //       //       backgroundColor: Colors.white,
              //       //       radius: 21,
              //       //       child: Padding(
              //       //         padding: const EdgeInsets.all(10),
              //       //         child: FittedBox(
              //       //           child: widget._listOfToDo[index].icon,
              //       //         ),
              //       //       ),
              //       //     ),
              //       //     // IconButton(
              //       //     //     icon: Icon(
              //       //     //       Icons.delete,
              //       //     //       color: Theme.of(context).errorColor,
              //       //     //     ),
              //       //     //     onPressed: () => _doneTd(index)),
              //       //     // IconButton(
              //       //     //   onPressed: () => _addNewToDo(title),
              //       //     //   icon: const Icon(
              //       //     //     Icons.copy,
              //       //     //     color: Colors.blue,
              //       //     //   ),
              //       //     // )
              //       //   ],
              //       // ),
              //     ),
              //   ),
              // );
              // },
              // );
              itemCount: widget._listOfToDo.length,
              //       ),
              //     ),
              //   ),
              // );
            ),
          ),
        ),
      ],
    );
  }
}

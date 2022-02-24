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
  final double leftPaddingTitleAndDescription = 16;
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
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: const Text(
            "My Tasks",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemBuilder: (
                context,
                index,
              ) {
                return Card(
                  color: widget._listOfToDo[index].backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 7,
                  ),
                  child: InkWell(
                    child: Container(
                      height: 65,
                      decoration: const BoxDecoration(
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
                              // Container(
                              //   margin: const EdgeInsets.only(
                              //     top: 12,
                              //     left: 12,
                              //     bottom: 8,
                              //   ),
                              //   decoration: BoxDecoration(
                              //       borderRadius: const BorderRadius.all(
                              //         Radius.circular(20),
                              //       ),
                              //       color: widget
                              //           ._listOfToDo[index].backgroundColor),
                              //   height: 16,
                              //   width: 105,
                              // ),
                              Container(
                                margin: const EdgeInsets.only(left: 9),
                                padding: EdgeInsets.only(
                                  top: 8,
                                  left: leftPaddingTitleAndDescription,
                                ),
                                width: 230,
                                child: Text(
                                  widget._listOfToDo[index].title,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Helvetica',
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 9),
                                padding: EdgeInsets.only(
                                  top: 5,
                                  left: leftPaddingTitleAndDescription,
                                ),
                                width: 230,
                                child: Text(
                                  widget._listOfToDo[index].description,
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: 'Helvetica',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            child:
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: <Widget>[
                                //     CircleAvatar(
                                //       backgroundColor: Colors.white,
                                //       radius: 21,
                                //       child: Padding(
                                //         padding: const EdgeInsets.all(10),
                                //         child: FittedBox(
                                //           child: widget._listOfToDo[index].icon,
                                //         ),
                                //       ),
                                //     ),
                                IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Theme.of(context).errorColor,
                              ),
                              onPressed: () => widget._doneTd(index),
                            ),
                          ),
                          // ],
                          //   ),
                          // ),
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

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transactionform extends StatefulWidget {
  final double heigth;
  final Function done;
  const Transactionform(this.heigth, this.done);

  @override
  _TransactionformState createState() => _TransactionformState();
}

class _TransactionformState extends State<Transactionform> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final primaryColor = Theme.of(context).primaryColor;
    return Positioned(
      bottom: 0,
      left: mediaQuery.size.width * .03,
      child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: mediaQuery.size.width * .94,
          height: mediaQuery.size.height * widget.heigth,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              )),
          child: Column(
            children: [
              Expanded(
                  child: AnimatedContainer(
                duration: Duration(
                  seconds: 1,
                ),
                curve: Curves.fastOutSlowIn,
                width: double.infinity,
                padding: const EdgeInsets.all(40),
                color: Colors.white.withOpacity(1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      readOnly: false,
                      initialValue: 'App Subscription',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                          isDense: true,
                          labelText: 'Title',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(12)),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          readOnly: false,
                          initialValue: '12',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          decoration: const InputDecoration(
                              isDense: true,
                              icon: Icon(Icons.attach_money),
                              contentPadding: const EdgeInsets.all(8)),
                        )),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: TextFormField(
                          readOnly: false,
                          initialValue: 'Business',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          decoration: const InputDecoration(
                              isDense: true,
                              icon: Icon(Icons.work),
                              contentPadding: const EdgeInsets.all(8)),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlineButton.icon(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          onPressed: () {},
                          icon: Icon(Icons.today),
                          label: Text(DateFormat('MMMM dd, yyyy')
                              .format(DateTime.now())),
                        ),
                        RaisedButton.icon(
                          color: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          onPressed: this.widget.done,
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          label: Text(
                            'ADD',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
            ],
          )),
    );
  }
}

// class Transactionform extends StatefulWidget {
//   final double heigth;
//   final Function done;

//   const Transactionform(this.heigth, this.done);
//   @override
//   _TransactionformState createState() => _TransactionformState();
// }

// class _TransactionformState extends State<Transactionform> {
//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final primaryColor = Theme.of(context).primaryColor;

//     return Positioned(
//       bottom: 0,
//       left: mediaQuery.size.width * .03,
//       child: AnimatedContainer(
//           duration: Duration(seconds: 1),
//           curve: Curves.fastOutSlowIn,
//           width: mediaQuery.size.width * .94,
//           height: mediaQuery.size.height * widget.heigth,
//           decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(12),
//                 topRight: Radius.circular(12),
//               )),
//           child: Column(
//             children: [
//               Expanded(
//                   child: AnimatedContainer(
//                 duration: Duration(
//                   seconds: 1,
//                 ),
//                 curve: Curves.fastOutSlowIn,
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(40),
//                 color: Colors.white.withOpacity(1),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     TextFormField(
//                       readOnly: false,
//                       initialValue: 'App Subscription',
//                       style: const TextStyle(
//                           fontSize: 14, fontWeight: FontWeight.bold),
//                       decoration: const InputDecoration(
//                           isDense: true,
//                           labelText: 'Title',
//                           border: OutlineInputBorder(),
//                           contentPadding: EdgeInsets.all(12)),
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                             child: TextFormField(
//                           readOnly: true,
//                           initialValue: '12',
//                           style: TextStyle(
//                               fontSize: 14, fontWeight: FontWeight.bold),
//                           decoration: const InputDecoration(
//                               isDense: true,
//                               icon: Icon(Icons.attach_money),
//                               contentPadding: const EdgeInsets.all(8)),
//                         )),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Expanded(
//                             child: TextFormField(
//                           readOnly: true,
//                           initialValue: 'Business',
//                           style: TextStyle(
//                               fontSize: 14, fontWeight: FontWeight.bold),
//                           decoration: const InputDecoration(
//                               isDense: true,
//                               icon: Icon(Icons.work),
//                               contentPadding: const EdgeInsets.all(8)),
//                         )),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         OutlineButton.icon(
//                           borderSide: BorderSide(width: 1, color: Colors.black),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                           onPressed: () {},
//                           icon: Icon(Icons.today),
//                           label: Text(DateFormat('MMMM dd, yyyy')
//                               .format(DateTime.now())),
//                         ),
//                         RaisedButton.icon(
//                           color: primaryColor,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(4)),
//                           onPressed: this.done,
//                           icon: const Icon(
//                             Icons.add,
//                             color: Colors.white,
//                           ),
//                           label: Text(
//                             'ADD',
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ))
//             ],
//           )),
//     );
//   }
// }

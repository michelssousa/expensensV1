// import 'package:flutter/material.dart';
// import 'package:flutterExpenses/src/presentation/home/listTransactions.dart';

// class Homescreen extends StatefulWidget {
//   @override
//   _HomescreenState createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
//   final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     final mediaQueryData = MediaQuery.of(context);
//     final size = mediaQueryData.size.width;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Money Manager'),
//         backgroundColor: Colors.black,
//         elevation: 1.0,
//         centerTitle: false,
//         actions: <Widget>[
//           new IconButton(icon: Icon(Icons.add), onPressed: () {}),
//           new IconButton(icon: Icon(Icons.settings), onPressed: () {}),
//         ],
//       ),
//       body: Listtransactions(),
//       bottomNavigationBar: Container(
//         color: Colors.white,
//         child: Row(
//           children: <Widget>[
//             Expanded(
//                 child: ListTile(
//               title: Text("Balance:"),
//               subtitle: Text(
//                 "R\$ 240,90",
//               ),
//             )),
//             Expanded(
//                 child: ListTile(
//               title: Text("Expenses:"),
//               subtitle: Text(
//                 " R\$ 240,90",
//                 style: TextStyle(color: Colors.red),
//               ),
//             )),
//             Expanded(
//                 child: IconButton(
//                     icon: Icon(
//                       Icons.remove_red_eye,
//                       color: Colors.red,
//                     ),
//                     onPressed: () => {})),
//           ],
//         ),
//       ),
//     );
//   }
// }

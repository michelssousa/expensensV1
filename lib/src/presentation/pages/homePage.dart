import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutterExpenses/src/presentation/pages/formTransactionPage.dart';
import 'package:flutterExpenses/src/presentation/pages/preTransactionListPage.dart';
import 'package:flutterExpenses/src/presentation/pages/settingsPage.dart';
import 'package:flutterExpenses/src/presentation/pages/transactionListPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  Widget _showPageList(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return FormTransactionPage();
        break;
      case 1:
        return TransactionListPage();
        break;
      case 2:
        return PreTransactionListPage();
        break;
      case 3:
        return SettingsTransaction();
        break;
      default:
        return Container(
          color: Colors.blueAccent,
          child: Text(
            _page.toString(),
            textScaleFactor: 2.0,
          ),
        );
    }
  }

  Widget _showPage = FormTransactionPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.content_copy, size: 30),
            Icon(Icons.settings, size: 30),
            //Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int index) {
            setState(() {
              _showPage = _showPageList(index);
            });
          },
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: _showPage,
          ),
        ));
  }
}

// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[400],
//       body: ListView(
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(top: 15.0, left: 10.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Column(
//                   children: <Widget>[
//                     Text('Money',
//                         style: TextStyle(
//                             fontFamily: 'Montserrat',
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 25.0)),
//                     Padding(
//                       padding: EdgeInsets.only(left: 26),
//                       child: Text('Manager',
//                           style: TextStyle(
//                               fontFamily: 'Montserrat',
//                               color: Colors.yellow,
//                               fontSize: 13.0)),
//                     ),
//                   ],
//                 ),
//                 SizedBox(width: 10.0),
//                 Container(
//                   width: 125.0,
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: <Widget>[
//                         IconButton(
//                           icon: Icon(Icons.content_copy),
//                           color: Colors.white,
//                           onPressed: () {},
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.settings),
//                           color: Colors.white,
//                           onPressed: () {},
//                         )
//                       ]),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 25.0,
//             child: Padding(
//               padding: EdgeInsets.only(top: 3),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Expanded(
//                       child: ListTile(
//                     title: Text("Balance:"),
//                     subtitle: Text(
//                       "R\$ 240,90",
//                     ),
//                   )),
//                   Expanded(
//                       child: ListTile(
//                     title: Text("Expenses:"),
//                     subtitle: Text(
//                       " R\$ 240,90",
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   )),
//                   Expanded(
//                     child: ListTile(
//                       title: Text("Expenses:"),
//                       subtitle: Text(
//                         " R\$ 240,90",
//                         style: TextStyle(color: Colors.red),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 23.0),
//             child: Row(
//               children: <Widget>[],
//             ),
//           ),
//           SizedBox(height: 30.0),
//           Container(
//             height: MediaQuery.of(context).size.height - 120.0,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(25.0),
//                   topRight: Radius.circular(25.0)),
//             ),
//             child: ListView(
//               primary: false,
//               padding: EdgeInsets.only(left: 25.0, right: 20.0),
//               children: <Widget>[
//                 Padding(
//                     padding: EdgeInsets.only(top: 60.0),
//                     child: Container(
//                         height: MediaQuery.of(context).size.height - 300.0,
//                         child: ListView(children: [
//                           Text('data'),
//                         ]))),
//                 Row(
//                   children: <Widget>[],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

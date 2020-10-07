// import 'package:flutter/material.dart';
// import 'package:grouped_list/grouped_list.dart';

// class Listtransactions extends StatefulWidget {
//   List _elements;

//   Listtransactions(List elements) {
//     this._elements = elements;
//   }

//   @override
//   _ListtransactionsState createState() => _ListtransactionsState();
// }

// class _ListtransactionsState extends State<Listtransactions> {
//   @override
//   Widget build(BuildContext context) {
//     return GroupedListView<dynamic, dynamic>(
//       elements: widget._elements,
//       groupBy: (element) => element['date'],
//       order: GroupedListOrder.ASC,
//       useStickyGroupSeparators: true,
//       groupSeparatorBuilder: (value) => Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Text(
//           value.toString(),
//           textAlign: TextAlign.left,
//           style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//         ),
//       ),
//       itemBuilder: (c, element) {
//         return Card(
//           elevation: 1.0,
//           margin: new EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//           child: Container(
//             child: ListTile(
//                 contentPadding:
//                     EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
//                 leading: Text(
//                   element['date'].toString().substring(1, 5),
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
//                 ), //Icon(Icons.expand_less, size: 30),
//                 title: Text(element['genericInfo'].toString()),
//                 subtitle: Text(element['descriptionInfo']),
//                 trailing: Text('R\$ ' + element['value'].toString(),
//                     style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight
//                             .bold))), //Text(element['date'].toString())),
//           ),
//         );
//       },
//     );
//   }
// }

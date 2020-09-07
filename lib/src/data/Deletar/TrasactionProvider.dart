// import 'dart:convert';
// import 'dart:math';

// import 'package:expensesApp/Data/Deletar/dummy_transaction.dart';
// import 'package:expensesApp/Domain/Transaction/Entity/Transaction.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class TransactionProvider with ChangeNotifier {
//   //final Map<String, Transaction> _items = {...DUMMY_TRANSACTION};
//   Map<String, Transaction> _items = {};

//   static const _baseUrl = 'https://flutter-myapp-teste.firebaseio.com/';

//   Future<Map<String, Transaction>> getStartList() async {
//     final response = await http.get("$_baseUrl/trasaction.json?");
//     final responseBody = json.decode(response.body) as Map<String, Transaction>;
//     return responseBody;
//   }

//   List<Transaction> get all {
//     return [..._items.values];
//   }

//   int get count {
//     return _items.length;
//   }

//   Transaction byIndex(int i) {
//     return _items.values.elementAt(i);
//   }

//   Future<void> put(Transaction transaction) async {
//     if (transaction == null) {
//       return;
//     }

//     if (transaction.id != null &&
//         transaction.id.isNotEmpty &&
//         _items.containsKey(transaction.id)) {
//       _items.update(
//           transaction.id,
//           (_) => Transaction(
//               id: transaction.id,
//               date: transaction.date,
//               genericInfo: transaction.genericInfo,
//               descriptionInfo: transaction.descriptionInfo,
//               month: transaction.month,
//               value: transaction.value));

//       await http.patch("$_baseUrl/trasaction/${transaction.id}.json",
//           body: json.encode({
//             'date': transaction.date,
//             'genericInfo': transaction.genericInfo,
//             'descriptionInfo': transaction.descriptionInfo,
//             'month': transaction.month,
//             'value': transaction.value
//           }));
//     } else {
//       final response = await http.post("$_baseUrl/trasaction.json",
//           body: json.encode({
//             'date': transaction.date,
//             'genericInfo': transaction.genericInfo,
//             'descriptionInfo': transaction.descriptionInfo,
//             'month': transaction.month,
//             'value': transaction.value
//           }));

//       final id = json.decode(response.body)['date'];

//       _items.putIfAbsent(
//           id,
//           () => Transaction(
//               id: id,
//               date: transaction.date,
//               genericInfo: transaction.genericInfo,
//               descriptionInfo: transaction.descriptionInfo,
//               month: transaction.month,
//               value: transaction.value));
//     }

//     //if (transaction == null) {
//     //} else {}
//     notifyListeners();
//   }

//   void remove(Transaction transaction) {
//     if (transaction != null && transaction.id != null) {
//       _items.remove(transaction.id);
//     }
//     notifyListeners();
//   }
// }

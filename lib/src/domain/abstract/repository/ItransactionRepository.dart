import 'package:flutterExpenses/src/domain/Entity/transaction/Transaction.dart';

mixin ItransactionRepository {
  // Future<Transaction> findById(String id);
  // Future<int> count();
  // Future<bool> delete(dynamic id);
  // Future<Transaction> update(Transaction item);
  // Future<HashMap<dynamic, Transaction>> betweenMonth(int start, int end);
  Transaction findById(String id);
  int count();
  bool delete(dynamic id);
  Transaction update(Transaction item);
  Map<String, Transaction> betweenMonth(int start, int end);
  Transaction create(String date, GenericInfo genericInfo,
      String descriptionInfo, double value, String userName);
  List betweenMonthListJson(int start, int end);
}

// @required this.date,
//       @required this.genericInfo,
//       @required this.descriptionInfo,
//       @required this.value,
//       @required this.userName

import 'dart:collection';

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
  HashMap<dynamic, Transaction> betweenMonth(int start, int end);
}

import 'dart:collection';

import 'package:flutterExpenses/src/domain/Entity/transaction/Transaction.dart';
import 'package:flutterExpenses/src/domain/abstract/repository/ItransactionRepository.dart';

class TransactionRespository implements ItransactionRepository {
  @override
  Future<HashMap<dynamic, Transaction>> betweenMonth(int start, int end) {
    // TODO: implement betweenMonth
    throw UnimplementedError();
  }

  @override
  Future<int> count() async {
    Future<int> _result = Future(() {
      return 12;
    });

    return _result;
  }

  @override
  Future<bool> delete(id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Transaction> findById(String id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<Transaction> update(Transaction item) {
    // TODO: implement update
    throw UnimplementedError();
  }
}

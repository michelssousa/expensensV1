import 'dart:collection';

import 'package:flutterExpenses/src/data/Deletar/dummy_transaction.dart';
import 'package:flutterExpenses/src/domain/Entity/transaction/Transaction.dart';
import 'package:flutterExpenses/src/domain/abstract/repository/ItransactionRepository.dart';

class TransactionRespository implements ItransactionRepository {
  final Map _mock = DUMMY_TRANSACTION;

  @override
  HashMap<dynamic, Transaction> betweenMonth(int start, int end) {
    // TODO: implement betweenMonth
    throw UnimplementedError();
  }

  @override
  int count() {
    return _mock.length;
  }

  @override
  bool delete(id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Transaction findById(String id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Transaction update(Transaction item) {
    // TODO: implement update
    throw UnimplementedError();
  }
}

// void main() async {
//   var m = await michel();
//   int m2= await michel2();
//   print('testando');
//    print(m);
//   print(m2);

// }

// Future<String> michel() async{
//   String lll = "Michel";
//   return await Future.delayed(Duration(seconds: 0),()=>lll);
// }

// Future<int> michel2() async{
//   int lll = 12;
//   return await Future.delayed(Duration(seconds: 0),()=>lll);

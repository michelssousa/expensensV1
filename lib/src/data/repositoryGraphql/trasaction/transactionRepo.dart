import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/data/Deletar/dummy_transaction.dart';
import 'package:flutterExpenses/src/domain/Entity/transaction/Transaction.dart';
import 'package:flutterExpenses/src/domain/abstract/repository/ItransactionRepository.dart';

class TransactionRespository with ItransactionRepository, ChangeNotifier {
  final Map<String, Transaction> _mock = {...DUMMY_TRANSACTION};

  @override
  Map<String, Transaction> betweenMonth(int start, int end) {
    final Map<String, Transaction> _result = {..._mock};
    return _result;
  }

  @override
  int count() {
    return _mock.length;
  }

  @override
  bool delete(id) {
    try {
      _mock.remove(id);
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Transaction findById(String id) {
    return _mock.values.elementAt(int.parse(id));
  }

  @override
  Transaction update(Transaction item) {
    var id = item.id;
    _mock.update(id, (_) => item);
    notifyListeners();
    return item;
  }

  @override
  Transaction create(String date, GenericInfo genericInfo,
      String descriptionInfo, double value, String userName) {
    var _result = Transaction(
        date: date,
        genericInfo: genericInfo,
        descriptionInfo: descriptionInfo,
        value: value,
        userName: userName);
    _mock.putIfAbsent(_result.id, () => _result);
    notifyListeners();
    return _result;
  }

  @override
  List betweenMonthListJson(int start, int end) {
    var _preResult = this.betweenMonth(start, end).values.toList();
    List _result = List<dynamic>();

    _preResult.forEach((element) {
      _result.add(element.toJson());
    });

    return _result;
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

// @required this.date,
//       @required this.genericInfo,
//       @required this.descriptionInfo,
//       @required this.value,
//       @required this.userName

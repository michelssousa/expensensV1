import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/domain/Entity/expenses/Expenses.dart';
import 'package:flutterExpenses/src/domain/Entity/transaction/Transaction.dart';
import 'package:flutterExpenses/src/domain/providers/presentation/providerPresentation.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Transactions with ChangeNotifier {
  //Transactions(this._monthStart, this._monthEnd);
  final _prov = ProviderPresentation();

  List<dynamic> transactions(int _monthStart, int _monthEnd) {
    final mod = ProviderPresentation().getModTransaction();
    var repo = mod.modTransaction();

    var _keys = repo.betweenMonthListJson(_monthStart, _monthEnd);

    return _keys;
  }

  List<String> transactionDescriptions() {
    return _prov.getTransactionDescripton();
  }

  ProviderPresentation getProvider() {
    return _prov;
  }

  List<charts.Series<Expenses, String>> getExpensesResume(List transactions) {
    return _prov.getExpensesSeries(transactions);
  }

  Color getColorTransaction(GenericInfo genericInfo) {
    return ProviderPresentation().getColorTransaction(genericInfo);
  }
}

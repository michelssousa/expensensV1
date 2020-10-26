import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/domain/Entity/expenses/Expenses.dart';
import 'package:flutterExpenses/src/domain/Entity/transaction/Transaction.dart';

import 'package:flutterExpenses/src/domain/providers/presentation/modConfig/config.dart';
import 'package:flutterExpenses/src/domain/providers/presentation/modTransaction/modTransaction.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

class ProviderPresentation with ChangeNotifier {
  Config getModConfig() {
    var _config = Config();
    return _config;
  }

  ModTransaction getModTransaction() {
    var _modTransaction = ModTransaction();
    return _modTransaction;
  }

  Color getColorTransaction(GenericInfo genericInfo) {
    return Transaction(
            date: '03/06/2020',
            genericInfo: genericInfo,
            descriptionInfo: 'Almoco de domingo',
            value: 0,
            userName: 'Michel')
        .getColor(genericInfo);
  }

  List<String> getTransactionDescripton() {
    return EnumToString.toList(GenericInfo.values, camelCase: true);
  }

  List<charts.Series<Expenses, String>> getExpensesSeries(List transactions) {
    // dentro da minha lista
    // recuperar genericInfor presentes na lista;
    // somar as transactions dessas genericInfo
    var mod = this.getModTransaction();
    var listTempTransactions = List<Transaction>();
    var dashbordItens = List<Expenses>();

    transactions.forEach((element) {
      var transTemp = mod.transactionViewCreate(element);
      listTempTransactions.add(transTemp);
    });

    GenericInfo.values.forEach((genericInfo) {
      double sumTemp;
      String categoryTemp;
      Color colorTemp;
      try {
        sumTemp = listTempTransactions
            .where((element) => element.genericInfo == genericInfo)
            .map<double>((e) => e.value)
            .reduce((value, element) => value + element);
        categoryTemp =
            EnumToString.convertToString(genericInfo, camelCase: true);
        colorTemp = getColorTransaction(genericInfo);
        dashbordItens.add(Expenses(categoryTemp, sumTemp, colorTemp));
      } catch (e) {
        sumTemp = 0;
      }
    });

    return [
      charts.Series<Expenses, String>(
          id: 'Expenses',
          domainFn: (Expenses expenses, _) => expenses.category,
          measureFn: (Expenses expenses, _) => expenses.value,
          labelAccessorFn: (Expenses expenses, _) =>
              '${NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 0).format(expenses.value)}',
          colorFn: (Expenses expenses, _) =>
              charts.ColorUtil.fromDartColor(expenses.color),
          data: dashbordItens.toList())
    ];
  }
}

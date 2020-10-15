import 'package:flutter/material.dart';

class Transaction {
  final int id;
  final String title;
  final double value;
  final String category;
  final IconData iconData;
  final Color color;

  const Transaction(
      {@required this.id,
      @required this.title,
      @required this.value,
      @required this.category,
      @required this.iconData,
      @required this.color});
}

class Transactions with ChangeNotifier {
  List<Transaction> _transactions = [
    Transaction(
        id: 1,
        title: 'Vestuario',
        value: 128.90,
        category: 'Vesturario',
        iconData: Icons.shop,
        color: Colors.black12),
    Transaction(
        id: 2,
        title: 'Alimentacao',
        value: -70.90,
        category: 'Alimentacao',
        iconData: Icons.fastfood,
        color: Colors.black12),
    Transaction(
        id: 3,
        title: 'Vesturario',
        value: 128.90,
        category: 'Alimentacao',
        iconData: Icons.fastfood,
        color: Colors.black12),
    Transaction(
        id: 4,
        title: 'Combustivel',
        value: 128.90,
        category: 'Ir Mae',
        iconData: Icons.local_gas_station,
        color: Colors.black12),
    Transaction(
        id: 1,
        title: 'Vestuario',
        value: 128.90,
        category: 'Vesturario',
        iconData: Icons.shop,
        color: Colors.black12),
    Transaction(
        id: 2,
        title: 'Alimentacao',
        value: -70.90,
        category: 'Alimentacao',
        iconData: Icons.fastfood,
        color: Colors.black),
    Transaction(
        id: 3,
        title: 'Vesturario',
        value: 128.90,
        category: 'Alimentacao',
        iconData: Icons.fastfood,
        color: Colors.black12),
    Transaction(
        id: 4,
        title: 'Combustivel',
        value: 128.90,
        category: 'Ir Mae',
        iconData: Icons.local_gas_station,
        color: Colors.black12),
  ];

  List<Transaction> get transactions {
    return _transactions;
  }
}

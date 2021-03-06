import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/presentation/old/components/headers.dart';
import 'package:flutterExpenses/src/presentation/old/components/newTransaction.dart';
import 'package:flutterExpenses/src/presentation/old/components/transactionForm.dart';
import 'package:flutterExpenses/src/presentation/old/components/transactionsCards.dart';
import 'package:flutterExpenses/src/presentation/routes/appRoutes.dart';
import 'package:provider/provider.dart';

import 'provider/transaction.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final int _monthStart = DateTime.now().month;
  final int _monthEnd = DateTime.now().month + 1;

  double _heigth = .55;
  double _opacity = .9;
  bool _visibility = true;

  void _addTransaction() {
    setState(() {
      // _heigth = .10;
      // _opacity = 1;
      //_visibility = false;
      Navigator.pushNamed(context, AppRoutes.FORM);
    });
  }

  void _openFilters() {
    setState(() {
      _heigth = .10;
      _opacity = 1;
    });
  }

  void _done() {
    setState(() {
      // _heigth = .55;
      // _opacity = .9;
      _visibility = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final providerTransaction = Provider.of<Transactions>(context);
    final listTransactions =
        providerTransaction.transactions(this._monthStart, this._monthEnd);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading:
              IconButton(icon: const Icon(Icons.short_text), onPressed: () {}),
          title: const Text(
            'Personal Finance',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(icon: const Icon(Icons.person_outline), onPressed: () {})
          ],
        ),
        body: Stack(
          children: <Widget>[
            Column(
              children: [
                Headers(_addTransaction, _openFilters, listTransactions),
                //Newtransaction(_opacity, _openFilters)
              ],
            ),
            Visibility(
              visible: this._visibility,
              child:
                  Transactionscards(_heigth, 1, 2, providerTransaction, _done),
              replacement: Transactionform(0.90, _done, providerTransaction),
            )
          ],
        ));
  }
}

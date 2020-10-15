import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/presentation/old/components/headers.dart';
import 'package:flutterExpenses/src/presentation/old/components/newTransaction.dart';
import 'package:flutterExpenses/src/presentation/old/components/transactionForm.dart';
import 'package:flutterExpenses/src/presentation/old/components/transactionsCards.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _heigth = .55;
  double _opacity = .9;
  bool _visibility = true;

  void _addTransaction() {
    setState(() {
      // _heigth = .10;
      // _opacity = 1;
      _visibility = false;
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

  void showForm(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Text('data'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
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
                Headers(_addTransaction, _openFilters),
                Newtransaction(_opacity, _openFilters)
              ],
            ),
            Visibility(
              visible: this._visibility,
              child: Transactionscards(_heigth),
              replacement: Transactionform(0.90, _done),
            )
          ],
        ));
  }
}

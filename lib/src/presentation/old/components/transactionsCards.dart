import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutterExpenses/src/presentation/old/components/transactionForm.dart';
import 'package:flutterExpenses/src/presentation/old/components/trasactionItem.dart';
import 'package:flutterExpenses/src/presentation/old/pages/form.dart';
import 'package:flutterExpenses/src/presentation/old/provider/transaction.dart';
import 'package:flutterExpenses/src/presentation/routes/appRoutes.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class Transactionscards extends StatefulWidget {
  final double heigth;
  final int _monthStart;
  final int _monthEnd;
  final Transactions providerTransaction;
  final Function _done;

  const Transactionscards(this.heigth, this._monthStart, this._monthEnd,
      this.providerTransaction, this._done);

  @override
  _TransactionscardsState createState() => _TransactionscardsState();
}

class _TransactionscardsState extends State<Transactionscards> {
  int _date = 16;

  void showFormCopy(BuildContext context, Map transaction) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
              builder: (context) => FormTransaction.copy(transaction)),
        )
        .then((value) => print(value['id']));
  }

  void showFormMore(BuildContext context, Map transaction) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
              builder: (context) => FormTransaction.more(transaction)),
        )
        .then((value) => print(value['id']));
  }

  void showFormEdit(BuildContext context, Map transaction) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
              builder: (context) => FormTransaction.edit(transaction)),
        )
        .then((value) => print(value['id']));
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final listTransactions = widget.providerTransaction
        .transactions(this.widget._monthStart, this.widget._monthEnd);

    void _showSnackBar(BuildContext context, String text) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
    }

    return Positioned(
      bottom: 0,
      left: mediaQuery.size.width * .03,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        width: mediaQuery.size.width * .94,
        height: mediaQuery.size.height * widget.heigth,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            )),
        child: Column(children: [
          Container(
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 12),
                  child: const Text(
                    'See All',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => setState(() => _date++),
                        child: const Icon(Icons.arrow_left),
                      ),
                      Text(
                        DateFormat('MMMM yyyy').format(DateTime.now()),
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                      InkWell(
                        onTap: () => setState(() => _date--),
                        child: const Icon(Icons.arrow_right),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: listTransactions.length,
                itemBuilder: (context, i) {
                  return Slidable(
                    child: Trasactionitem(listTransactions[i]),
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    actions: [
                      IconSlideAction(
                          caption: 'Edit',
                          color: Colors.black54,
                          icon: Icons.mode_edit,
                          onTap: () =>
                              this.showFormEdit(context, listTransactions[i])),
                      IconSlideAction(
                          caption: 'Copy',
                          color: Colors.blue,
                          icon: Icons.content_copy,
                          onTap: () =>
                              this.showFormCopy(context, listTransactions[i])),
                    ],
                    secondaryActions: [
                      IconSlideAction(
                          caption: 'More',
                          color: Colors.black45,
                          icon: Icons.more_horiz,
                          onTap: () =>
                              this.showFormMore(context, listTransactions[i])),
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () => _showSnackBar(context, 'Delete'),
                      ),
                    ],
                  );
                }),
          )
        ]),
      ),
    );
  }
}

// Trasactionitem(listTransactions[i])

//  Scaffold.of(context).showSnackBar(
//                           SnackBar(content: Text("Item ${context} dismissed")));

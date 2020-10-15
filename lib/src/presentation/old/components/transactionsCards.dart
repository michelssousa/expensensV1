import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/presentation/old/components/trasactionItem.dart';
import 'package:flutterExpenses/src/presentation/old/provider/transaction.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Transactionscards extends StatefulWidget {
  final double heigth;

  const Transactionscards(this.heigth);

  @override
  _TransactionscardsState createState() => _TransactionscardsState();
}

class _TransactionscardsState extends State<Transactionscards> {
  int _date = 16;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final providerTransaction = Provider.of<Transactions>(context);
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
                itemCount: providerTransaction.transactions.length,
                itemBuilder: (context, i) {
                  return Trasactionitem(providerTransaction.transactions[i]);
                }),
          )
        ]),
      ),
    );
  }
}

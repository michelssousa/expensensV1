import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutterExpenses/src/presentation/old/Models/Expenses.dart';
import 'package:flutterExpenses/src/presentation/old/components/ExpensesChart.dart';

class Headers extends StatelessWidget {
  final Function addTransaction;
  final Function openFilter;

  const Headers(this.addTransaction, this.openFilter);

  static List<charts.Series<Expenses, String>> _serie = [
    charts.Series<Expenses, String>(
        id: 'Expenses',
        domainFn: (Expenses expenses, _) => expenses.category,
        measureFn: (Expenses expenses, _) => expenses.value,
        labelAccessorFn: (Expenses expenses, _) => '\$${expenses.value}',
        colorFn: (Expenses expenses, _) =>
            charts.ColorUtil.fromDartColor(expenses.color),
        data: [
          Expenses('Vestuario', 140, Colors.black),
          Expenses('Alimentacao', 112, Colors.black38),
          Expenses('Combustivel', 125, Colors.amber),
          Expenses('Outros', 125, Colors.red),
        ])
  ];
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final mediaQuery = MediaQuery.of(context);
    return Container(
      width: double.infinity,
      height: mediaQuery.size.height * .4,
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 112,
              child: Expenseschart(_serie, true),
            ),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineButton(
                  onPressed: this.addTransaction,
                  borderSide: const BorderSide(width: 1, color: Colors.white),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  child: Container(
                    width: 124,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.playlist_add, color: Colors.white),
                        const SizedBox(width: 4),
                        const Text(
                          'Add Transaction',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                FlatButton(
                    onPressed: this.openFilter,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: Container(
                      width: 124,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Reports',
                            style: TextStyle(
                                fontSize: 12,
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  'Transactions',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}

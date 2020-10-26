import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/domain/Entity/expenses/Expenses.dart';

import 'package:flutterExpenses/src/presentation/old/components/ExpensesChart.dart';
import 'package:flutterExpenses/src/presentation/old/provider/transaction.dart';

class Headers extends StatelessWidget {
  final Function addTransaction;
  final Function openFilter;
  List<dynamic> transactionsList;
  List<charts.Series<Expenses, String>> _series;

  Headers(this.addTransaction, this.openFilter, this.transactionsList) {
    this._series = Transactions().getExpensesResume(this.transactionsList);
  }

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
              height: 110,
              child: Expenseschart(_series, true),
            ),
            SizedBox(height: 10),
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
              ],
            ),
            SizedBox(
              height: 10,
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
// children: [
//   OutlineButton(
//     onPressed: this.addTransaction,
//     borderSide: const BorderSide(width: 1, color: Colors.white),
//     shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(24)),
//     child: Container(
//       width: 124,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(Icons.playlist_add, color: Colors.white),
//           const SizedBox(width: 4),
//           const Text(
//             'Add Transaction',
//             style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold),
//           )
//         ],
//       ),
//     ),
//   ),
//   FlatButton(
//       onPressed: this.openFilter,
//       color: Colors.white,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(24)),
//       child: Container(
//         width: 124,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Reports',
//               style: TextStyle(
//                   fontSize: 12,
//                   color: primaryColor,
//                   fontWeight: FontWeight.bold),
//             ),
//             Icon(
//               Icons.navigate_next,
//               color: primaryColor,
//             ),
//           ],
//         ),
//       ))
// ]

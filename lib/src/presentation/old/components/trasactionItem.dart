import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/domain/Entity/transaction/Transaction.dart';
import 'package:intl/intl.dart';

class Trasactionitem extends StatelessWidget {
  Transaction transaction;

  Trasactionitem(Map transaction) {
    this.transaction = Transaction.fromJson(transaction);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListTile(
        leading: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: transaction.color
                  .withOpacity(.9), // transaction.color.withOpacity(0.8)
              borderRadius: BorderRadius.circular(12)),
          alignment: Alignment.center,
          child: Icon(
            transaction.iconData,
            size: 20,
            color: Colors.white,
          ),
        ),
        title: Text(
          transaction.title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '${transaction.date.substring(0, 5)} ${transaction.descriptionInfo}',
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat'),
        ),
        trailing: Text(
          '${NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2).format(transaction.value)}',
          style: TextStyle(
              fontSize: 12,
              color:
                  transaction.value > 0 ? Colors.black : Colors.redAccent[400],
              fontFamily: 'Montserrat'),
        ),
      ),
    );
  }
}

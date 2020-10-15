import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/presentation/old/provider/transaction.dart';

class Trasactionitem extends StatelessWidget {
  final Transaction transaction;

  const Trasactionitem(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListTile(
        leading: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: transaction.color.withOpacity(.8),
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
          transaction.category,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat'),
        ),
        trailing: Text(
          'R\$ ${transaction.value}',
          style: TextStyle(
              fontSize: 12, color: Colors.black, fontFamily: 'Montserrat'),
        ),
      ),
    );
  }
}

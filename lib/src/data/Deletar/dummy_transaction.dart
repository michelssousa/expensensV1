import 'package:flutterExpenses/src/domain/Entity/transaction/Transaction.dart';

Map<String, Transaction> DUMMY_TRANSACTION = {
  'A': Transaction(
      date: '02/06/2020',
      genericInfo: 'Vestuario',
      descriptionInfo: 'Compra Blusa',
      value: 2012.30,
      userName: 'Michel'),
  'B': Transaction(
      date: '02/06/2020',
      genericInfo: 'Combustiveis',
      descriptionInfo: 'Compra Blusa',
      value: 20.30,
      userName: 'Michel'),
  'C': Transaction(
      date: '03/06/2020',
      genericInfo: 'Alimentacao',
      descriptionInfo: 'Almoco de domingo',
      value: 40.20,
      userName: 'Michel'),
  'D': Transaction(
      date: '03/06/2020',
      genericInfo: 'Vestuario',
      descriptionInfo: 'Compra sapatos',
      value: 20.30,
      userName: 'Michel'),
  'E': Transaction(
      date: '04/06/2020',
      genericInfo: 'Servicos',
      descriptionInfo: 'Manutencao na casa',
      value: 2120.30,
      userName: 'Michel'),
  'F': Transaction(
      date: '04/06/2020',
      genericInfo: 'Vestuario',
      descriptionInfo: 'Compra Blusa',
      value: 2340.20,
      userName: 'Michel'),
};

// const DUMMY_TRANSACTION = {
//   '0': const Transaction(
//       date: '2020/08/10',
//       genericInfo: 'Vestuario',
//       descriptionInfo: 'Compra de blusa',
//       value: 98.1),
//   '1': const Transaction(
//       date: '2020/08/10',
//       genericInfo: 'Combustivel',
//       descriptionInfo: 'trabalho',
//       value: 21.10),
//   '2': const Transaction(
//       date: '2020/08/10',
//       genericInfo: 'Combustivel',
//       descriptionInfo: 'trabalho',
//       value: 100.10),
// };

// String date;
// String genericInfo;
// String descriptionInfo;
// int month;
// double value;
// String userName;
// int year;

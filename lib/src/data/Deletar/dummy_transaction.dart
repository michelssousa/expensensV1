import 'package:flutterExpenses/src/domain/Entity/transaction/Transaction.dart';

Map<String, Transaction> DUMMY_TRANSACTION = {
  'A': Transaction(
      date: '02/06/2020',
      genericInfo: GenericInfo.alimentacao,
      descriptionInfo: 'Compra Blusa',
      value: 2012.30,
      userName: 'Michel'),
  'B': Transaction(
      date: '02/06/2020',
      genericInfo: GenericInfo.combustivel,
      descriptionInfo: 'Ir na minha mae',
      value: 20.30,
      userName: 'Michel'),
  'C': Transaction(
      date: '03/06/2020',
      genericInfo: GenericInfo.diversos,
      descriptionInfo: 'Almoco de domingo',
      value: 40.20,
      userName: 'Michel'),
  'D': Transaction(
      date: '03/06/2020',
      genericInfo: GenericInfo.educacao,
      descriptionInfo: 'Compra sapatos',
      value: 20.30,
      userName: 'Michel'),
  'E': Transaction(
      date: '04/06/2020',
      genericInfo: GenericInfo.entrada,
      descriptionInfo: 'Manutencao na casa',
      value: 2120.30,
      userName: 'Michel'),
  'F': Transaction(
      date: '04/06/2020',
      genericInfo: GenericInfo.habitacao,
      descriptionInfo: 'Compra Blusa',
      value: 2340.20,
      userName: 'Michel'),
  'L': Transaction(
      date: '02/06/2020',
      genericInfo: GenericInfo.lazer,
      descriptionInfo: 'Compra Blusa',
      value: 2012.30,
      userName: 'Michel'),
  'G': Transaction(
      date: '02/06/2020',
      genericInfo: GenericInfo.servicos,
      descriptionInfo: 'Ir na minha mae',
      value: 20.30,
      userName: 'Michel'),
  'H': Transaction(
      date: '03/06/2020',
      genericInfo: GenericInfo.transportes,
      descriptionInfo: 'Almoco de domingo',
      value: 40.20,
      userName: 'Michel'),
  'I': Transaction(
      date: '03/06/2020',
      genericInfo: GenericInfo.entrada,
      descriptionInfo: 'Venda de Roupa',
      value: 200,
      userName: 'Michel'),
  'J': Transaction(
      date: '30/06/2020',
      genericInfo: GenericInfo.entrada,
      descriptionInfo: 'Pred. PUC',
      value: 2120.30,
      userName: 'Michel'),
  'K': Transaction(
      date: '21/06/2020',
      genericInfo: GenericInfo.entrada,
      descriptionInfo: 'Pred. Gordinhos',
      value: 2340.20,
      userName: 'Michel'),
};

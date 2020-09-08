import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/domain/Entity/transaction/Transaction.dart';
import 'package:flutterExpenses/src/domain/providers/infra/repository/providerRepository.dart';
import 'package:flutterExpenses/src/domain/providers/presentation/providerPresentation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'src/presentation/app.dart';

Future<void> main() async {
  await DotEnv().load('.env_dev');
  runApp(App());

  var item = Transaction(
      date: "01/12/2020",
      genericInfo: 'Alimentacao',
      descriptionInfo: 'Almoco domingo',
      value: 100.89,
      userName: 'Michel');
  var mod = ProviderPresentation().getModTransaction();

  var repo = mod.modTransaction();

  var count = repo.count();

  print('Tesntando o Create valor e repositorio mock e Inicial $count');

  var result = repo.create(item.date, item.genericInfo, item.descriptionInfo,
      item.value, item.userName);

  count = repo.count();

  print('\nTesntando o Create valor e repositorio mock Final $count');

  print('\nTesntando Update');
  result.date = '12/12/2021';

  var novo = result;

  var novoResult = repo.update(novo);

  print(
      '\nTesntando o Update valor e repositorio mock Final\n ${novoResult.toJson()}');

  print('\nTesntando Delete');

  var retornor = repo.delete('A');
  var retornor2 = repo.delete('C');

  count = repo.count();

  var keys = repo.betweenMonth(1, 2).keys;

  print(
      '\nTesntando o Delete valor e repositorio mock Final $count iten(s) retorno funcao = $retornor\n chaves $keys ');
}

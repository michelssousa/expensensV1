import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/data/Deletar/dummy_transaction.dart';
import 'package:flutterExpenses/src/domain/providers/infra/repository/providerRepository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'src/presentation/app.dart';

Future<void> main() async {
  await DotEnv().load('.env_dev');
  runApp(App());
  var repo = ProviderRepository().transactionDAO().count();
  print('valor e repositorio mock e $repo');
}

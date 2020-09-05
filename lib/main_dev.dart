import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/domain/providers/infra/repository/providerRepository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'src/presentation/app.dart';

Future<void> main() async {
  await DotEnv().load('.env_dev');
  runApp(App());
  var repo = ProviderRepository().transactionDAO().count();
  repo.then((value) => print(value));
}

import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/presentation/app.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await DotEnv().load('.env');
  runApp(App());
}

import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/domain/Entity/transaction/Transaction.dart';
import 'package:flutterExpenses/src/domain/providers/presentation/providerPresentation.dart';
import 'package:flutterExpenses/src/domain/providers/variables/globalVariables.dart';
import 'package:flutterExpenses/src/presentation/old/home.dart';
import 'package:flutterExpenses/src/presentation/old/provider/transaction.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final Map<String, String> variaveisDeAmbiente = VARIABLES_GLOBAL;
  var _appColor = ProviderPresentation().getModConfig().getColor();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Transactions(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: _appColor.fontFamily),
        home: Home(),
      ),
    );
  }
}

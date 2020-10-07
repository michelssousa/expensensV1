import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/domain/providers/presentation/providerPresentation.dart';
import 'package:flutterExpenses/src/domain/providers/variables/globalVariables.dart';
import 'package:flutterExpenses/src/presentation/old/homeScreen.dart';

class App extends StatelessWidget {
  final Map<String, String> variaveisDeAmbiente = VARIABLES_GLOBAL;
  var _appColor = ProviderPresentation().getModConfig().getColor();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: _appColor.fontFamily),
      home: Homescreen(),
    );
  }
}

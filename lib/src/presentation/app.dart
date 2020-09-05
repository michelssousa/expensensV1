import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class App extends StatelessWidget {
  final Map<String, String> variaveisDeAmbiente = DotEnv().env;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(variaveisDeAmbiente['title']),
        ),
        body: Container(
          child: Center(
            child: Text(
              variaveisDeAmbiente['baseUrl'],
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}

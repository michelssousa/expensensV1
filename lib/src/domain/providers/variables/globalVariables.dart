import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

final Map<String, String> VARIABLES_GLOBAL = DotEnv().env;

var categorySystem = [
  {'label': 'Habitação', 'value': 'Habitação', 'icon': Icons.home},
  {'label': 'Alimentaçāo', 'value': 'Alimentaçāo', 'icon': Icons.local_dining},
  {
    'label': 'Transporte (combustível)',
    'value': 'Transporte',
    'icon': Icons.local_gas_station
  },
  {'label': 'Transporte', 'value': 'Transporte', 'icon': Icons.drive_eta},
  {'label': 'Educação', 'value': 'Educação', 'icon': Icons.library_books},
  {'label': 'Vestuário', 'value': 'Vestuário', 'icon': Icons.add_shopping_cart},
  {'label': 'Seviços', 'value': 'Seviços', 'icon': Icons.shopping_basket},
  {'label': 'Lazer', 'value': 'Lazer', 'icon': Icons.child_care},
  {'label': 'Entradas', 'value': 'Entradas', 'icon': Icons.monetization_on},
  {
    'label': 'Diversos',
    'value': 'Diversos',
    'icon': Icons.account_balance_wallet
  },
];

//Habitação Alimentação Transporte Educação Vestuário Seviços Recreação ,Higiêne Pessoal,

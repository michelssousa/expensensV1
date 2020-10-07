import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

final Map<String, String> VARIABLES_GLOBAL = DotEnv().env;

final Map<String, dynamic> CATEGORY_SYSTEM = {
  'Habitação': {'label': 'Habitação', 'value': 'Habitação', 'icon': Icons.home},
  'Alimentaçāo': {
    'label': 'Alimentaçāo',
    'value': 'Alimentaçāo',
  },
  'Transporte (combustível)': {
    'label': 'Transporte (combustível)',
    'value': 'Transporte',
  },
  'Transporte': {
    'label': 'Transporte',
    'value': 'Transporte',
  },
  'Educação': {
    'label': 'Educação',
    'value': 'Educação',
  },
  'Vestuário': {
    'label': 'Vestuário',
    'value': 'Vestuario',
  },
  'Seviços': {
    'label': 'Serviços',
    'value': 'Serviços',
  },
  'Lazer': {'label': 'Lazer', 'value': 'Lazer', 'icon': Icons.child_care},
  'Entradas': {
    'label': 'Entradas',
    'value': 'Entradas',
  },
  'Diversos': {
    'label': 'Diversos',
    'value': 'Diversos',
  }
};

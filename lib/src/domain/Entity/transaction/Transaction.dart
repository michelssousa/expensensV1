import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/domain/abstract/entity/IEntity.dart';

import 'package:intl/intl.dart';

enum GenericInfo {
  habitacao,
  alimentacao,
  combustivel,
  transportes,
  educacao,
  vestuario,
  servicos,
  lazer,
  diversos,
  entrada,
  emprestimo
}

class Transaction extends IEntity {
  String date;
  GenericInfo genericInfo;
  String descriptionInfo;
  int month;
  double value;
  String userName;
  int year;
  IconData _iconData;
  Color _color;

  Transaction(
      {@required this.date,
      @required this.genericInfo,
      @required this.descriptionInfo,
      @required this.value,
      @required this.userName})
      : super() {
    this.month = _getMonth(this.date);
    this.year = _getYear(this.date);
    this.value = _valueTrasaction(this.value);
  }

  Transaction.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    date = json['date'];
    genericInfo = json['genericInfo'];
    descriptionInfo = json['descriptionInfo'];
    month = json['month'] != "" ? json['month'] : _getMonth(json['date']);
    value = _valueTrasaction(json['value']);
    userName = json['userName'];
    year = json['tr_year'];
  }

  @override
  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['genericInfo'] = this.genericInfo;
    data['descriptionInfo'] = this.descriptionInfo;
    data['month'] = this.month;
    data['value'] = this.value;
    data['userName'] = this.userName;
    data['tr_year'] = this.year;
    return data;
  }

  IconData get iconData {
    this._iconData = _getIcon(this.genericInfo);
    return this._iconData;
  }

  Color get color {
    this._color = getColor(this.genericInfo);
    return this._color;
  }

  String get title {
    String ret;
    ret = EnumToString.convertToString(this.genericInfo, camelCase: true);
    return ret;
  }

  double _valueTrasaction(double value) {
    return this.genericInfo == GenericInfo.entrada ? value : value * -1;
  }

  @override
  bool isValid() {
    var _isValid = true;
    var fields = [
      this.date,
      this.descriptionInfo,
      this.value,
      this.genericInfo
    ];

    for (var field in fields) {
      _isValid = field != '' ? true : false;
      if (_isValid != true) {
        break;
      }
    }
    return _isValid;
  }

  int _getMonth(String dmyString) {
    var dateTime1 = DateFormat('d/M/yyyy').parse(dmyString);
    return dateTime1.month;
  }

  int _getYear(String dmyString) {
    var dateTime1 = DateFormat('d/M/yyyy').parse(dmyString);
    return dateTime1.year;
  }

  IconData _getIcon(GenericInfo genericInfo) {
    IconData ret;

    switch (genericInfo) {
      case GenericInfo.habitacao:
        {
          ret = Icons.home;
        }
        break;
      case GenericInfo.alimentacao:
        {
          ret = Icons.fastfood;
        }
        break;
      case GenericInfo.combustivel:
        {
          ret = Icons.local_gas_station;
        }
        break;
      case GenericInfo.transportes:
        {
          ret = Icons.local_taxi;
        }
        break;
      case GenericInfo.educacao:
        {
          ret = Icons.school;
        }
        break;
      case GenericInfo.vestuario:
        {
          ret = Icons.shopping_basket;
        }
        break;
      case GenericInfo.servicos:
        {
          ret = Icons.transfer_within_a_station;
        }
        break;
      case GenericInfo.lazer:
        {
          ret = Icons.child_care;
        }
        break;
      case GenericInfo.diversos:
        {
          ret = Icons.add_shopping_cart;
        }
        break;
      case GenericInfo.entrada:
        {
          ret = Icons.monetization_on;
        }
        break;
      case GenericInfo.emprestimo:
        {
          ret = Icons.mood_bad;
        }
        break;
      default:
        {
          ret = Icons.local_grocery_store;
        }
    }
    return ret;
  }

  Color getColor(GenericInfo genericInfo) {
    Color ret;

    switch (genericInfo) {
      case GenericInfo.habitacao:
        {
          ret = Colors.lightGreenAccent;
        }
        break;
      case GenericInfo.alimentacao:
        {
          ret = Colors.amber;
        }
        break;
      case GenericInfo.combustivel:
        {
          ret = Colors.black;
        }
        break;
      case GenericInfo.transportes:
        {
          ret = Colors.black;
        }
        break;
      case GenericInfo.educacao:
        {
          ret = Colors.yellowAccent;
        }
        break;
      case GenericInfo.vestuario:
        {
          ret = Colors.cyanAccent;
        }
        break;
      case GenericInfo.servicos:
        {
          ret = Colors.indigo[400];
        }
        break;
      case GenericInfo.lazer:
        {
          ret = Colors.blue[300];
        }
        break;
      case GenericInfo.diversos:
        {
          ret = Colors.deepOrangeAccent;
        }
        break;
      case GenericInfo.entrada:
        {
          ret = Colors.green;
        }
        break;
      case GenericInfo.emprestimo:
        {
          ret = Colors.red;
        }
        break;
      default:
        {
          ret = Colors.black;
        }
    }
    return ret;
  }
}

import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/domain/abstract/entity/IEntity.dart';

import 'package:intl/intl.dart';

class Transaction extends IEntity {
  String date;
  String genericInfo;
  String descriptionInfo;
  int month;
  double value;
  String userName;
  int year;

  Transaction(
      {@required this.date,
      @required this.genericInfo,
      @required this.descriptionInfo,
      @required this.value,
      @required this.userName})
      : super() {
    this.month = _getMonth(this.date);
    this.year = _getYear(this.date);
  }

  Transaction.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    date = json['date'];
    genericInfo = json['genericInfo'];
    descriptionInfo = json['descriptionInfo'];
    month = json['month'] != "" ? json['month'] : _getMonth(json['date']);
    value = json['value'];
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
}

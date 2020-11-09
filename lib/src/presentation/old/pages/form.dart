import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/domain/Entity/transaction/Transaction.dart';
import 'package:flutterExpenses/src/presentation/old/provider/transaction.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart';

class FormTransaction extends StatefulWidget {
  // final Function done;
  // final Transactions prov;

  Transaction _transaction;
  DateTime _selectedDate = DateTime.now();
  GenericInfo _info;
  String _description = "Breve descriçāo da Transaçāo";
  String _owner;
  double _heigth = .55;
  String _buttonLabel = 'ADD';
  bool _modify = true;

  var controller = new MoneyMaskedTextController(
      initialValue: 0,
      decimalSeparator: ',',
      thousandSeparator: '.',
      precision: 2);

  FormTransaction() {
    this._modify = false;
  }

  FormTransaction.copy(Map transaction) {
    this.initializeForm(transaction);
    this.controller.updateValue(0);
    this._selectedDate = DateTime.now();
    this._buttonLabel = 'COPY SAVE';
    this._modify = false;
  }

  FormTransaction.more(Map transaction) {
    this.initializeForm(transaction);
    this._modify = true;
  }
  FormTransaction.edit(Map transaction) {
    this.initializeForm(transaction);
    this._buttonLabel = 'MODIFY SAVE';
    this._modify = false;
  }

  void _dataBack(BuildContext context, Transaction transaction) {
    Navigator.of(context).pop(transaction);
  }

  void initializeForm(Map transaction) {
    this._transaction = Transaction.fromJson(transaction);
    this._description = this._transaction.descriptionInfo;
    this._info = this._transaction.genericInfo;
    this.controller.updateValue(this._transaction.value);
    this._selectedDate = DateFormat('d/M/yyyy').parse(this._transaction.date);
    this._owner = this._transaction.userName;
  }

  @override
  _FormTransactionState createState() => _FormTransactionState();
}

class _FormTransactionState extends State<FormTransaction> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final primaryColor = Theme.of(context).primaryColor;

    Future<void> _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(DateTime.now().year - 1),
          lastDate: DateTime(DateTime.now().year + 5));
      if (picked != null && picked != widget._selectedDate)
        setState(() {
          widget._selectedDate = picked;
        });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        width: mediaQuery.size.width * .94,
        height: mediaQuery.size.height * widget._heigth,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            )),
        child: Column(
          children: [
            Expanded(
              child: IgnorePointer(
                ignoring: widget._modify,
                child: AnimatedContainer(
                  duration: Duration(
                    seconds: 10,
                  ),
                  curve: Curves.fastOutSlowIn,
                  width: double.infinity,
                  padding: const EdgeInsets.all(40),
                  color: Colors.white.withOpacity(1),
                  child: Wrap(children: [
                    TextFormField(
                      textAlign: TextAlign.center,
                      maxLength: 30,
                      readOnly: false,
                      initialValue: widget._description,
                      onChanged: (String valueNew) {
                        setState(() {
                          widget._description = valueNew;
                        });
                      },
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                          isDense: true,
                          labelText: 'Descriçāo',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(12)),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlineButton.icon(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            onPressed: () => _selectDate(context),
                            icon: Icon(Icons.today),
                            label: Text(DateFormat('MMMM dd, yyyy')
                                .format(widget._selectedDate)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          controller: widget.controller,
                          readOnly: widget._modify,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          decoration: const InputDecoration(
                              isDense: true,
                              icon: Icon(Icons.attach_money),
                              contentPadding: const EdgeInsets.all(8)),
                        )),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: DropdownButton<GenericInfo>(
                                hint: Text("Finalidade"),
                                isExpanded: true,
                                value: widget._info,
                                onChanged: (GenericInfo newValue) {
                                  setState(() {
                                    widget._info = newValue;
                                  });
                                },
                                items: GenericInfo.values
                                    .map((GenericInfo classType) {
                                  return DropdownMenuItem<GenericInfo>(
                                      value: classType,
                                      child: Text(EnumToString.convertToString(
                                          classType,
                                          camelCase: true)));
                                }).toList())),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: DropdownButton<String>(
                                value: widget._owner,
                                isExpanded: true,
                                items: [
                                  new DropdownMenuItem(
                                      value: 'Michel',
                                      child: Center(
                                        child: new Text(
                                          "Michel",
                                          textAlign: TextAlign.end,
                                        ),
                                      )),
                                  new DropdownMenuItem(
                                      value: 'Miguel',
                                      child: Center(
                                        child: new Text(
                                          "Miguel",
                                          textAlign: TextAlign.end,
                                        ),
                                      )),
                                  new DropdownMenuItem(
                                      value: 'Mafalda',
                                      child: Center(
                                        child: new Text(
                                          "Mafalda",
                                          textAlign: TextAlign.end,
                                        ),
                                      )),
                                  new DropdownMenuItem(
                                      value: 'Outros',
                                      child: Center(
                                        child: new Text(
                                          "Outros",
                                          textAlign: TextAlign.end,
                                        ),
                                      )),
                                ],
                                hint: Center(
                                  child: new Text(
                                    "Quem gerou à transaçāo?",
                                  ),
                                ),
                                onChanged: (String value) {
                                  setState(() {
                                    widget._owner = value;
                                  });
                                }))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Visibility(
                            visible: !widget._modify,
                            child: RaisedButton.icon(
                              color: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              onPressed: () => widget._dataBack(
                                  context, widget._transaction),
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              label: Text(
                                widget._buttonLabel,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

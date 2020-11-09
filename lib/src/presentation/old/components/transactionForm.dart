import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/domain/Entity/transaction/Transaction.dart';
import 'package:flutterExpenses/src/presentation/old/provider/transaction.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Transactionform extends StatefulWidget {
  final double heigth;
  final Function done;
  final Transactions prov;
  Transaction _transaction;

  var controller = new MoneyMaskedTextController(
      initialValue: 0,
      decimalSeparator: ',',
      thousandSeparator: '.',
      precision: 2);

  DateTime _selectedDate = DateTime.now();
  GenericInfo _info;
  String _description;
  String _owner;

  Transactionform(this.heigth, this.done, this.prov);
  Transactionform.more(this.heigth, this.done, this.prov, Map transaction) {
    this._transaction = Transaction.fromJson(transaction);
    _selectedDate = DateFormat('d/M/yyyy').parse(this._transaction.date);
  }
  Transactionform.copy(this.heigth, this.done, this.prov, this._transaction);

  @override
  _TransactionformState createState() => _TransactionformState();
}

class _TransactionformState extends State<Transactionform> {
  void _done() {
    double _value = double.parse(
        widget.controller.value.text.replaceAll('.', '').replaceAll(',', '.'));
    String _data = DateFormat('d/M/yyyy').format(widget._selectedDate);

    var result = widget.prov.transactionSave(
        _data, widget._info, widget._description, _value, widget._owner);
    if (result) {
      widget.done();
    }
  }

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

    return Positioned(
      bottom: 0,
      left: mediaQuery.size.width * .03,
      child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: mediaQuery.size.width * .94,
          height: mediaQuery.size.height * widget.heigth,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              )),
          child: Column(
            children: [
              Expanded(
                  child: AnimatedContainer(
                duration: Duration(
                  seconds: 10,
                ),
                curve: Curves.fastOutSlowIn,
                width: double.infinity,
                padding: const EdgeInsets.all(40),
                color: Colors.white.withOpacity(1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      textAlign: TextAlign.center,
                      maxLength: 30,
                      readOnly: false,
                      initialValue: 'Breve descriçāo da Transaçāo',
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
                          readOnly: false,
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
                          child: RaisedButton.icon(
                            color: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            onPressed: () {
                              _done();
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            label: Text(
                              'ADD',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
            ],
          )),
    );
  }
}

// Transaction(
//       date: '03/06/2020',
//       genericInfo: GenericInfo.educacao,
//       descriptionInfo: 'Compra sapatos',
//       value: 20.30,
//       userName: 'Michel')

// class Transactionform extends StatefulWidget {
//   final double heigth;
//   final Function done;

//   const Transactionform(this.heigth, this.done);
//   @override
//   _TransactionformState createState() => _TransactionformState();
// }

// class _TransactionformState extends State<Transactionform> {
//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final primaryColor = Theme.of(context).primaryColor;

//     return Positioned(
//       bottom: 0,
//       left: mediaQuery.size.width * .03,
//       child: AnimatedContainer(
//           duration: Duration(seconds: 1),
//           curve: Curves.fastOutSlowIn,
//           width: mediaQuery.size.width * .94,
//           height: mediaQuery.size.height * widget.heigth,
//           decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(12),
//                 topRight: Radius.circular(12),
//               )),
//           child: Column(
//             children: [
//               Expanded(
//                   child: AnimatedContainer(
//                 duration: Duration(
//                   seconds: 1,
//                 ),
//                 curve: Curves.fastOutSlowIn,
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(40),
//                 color: Colors.white.withOpacity(1),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     TextFormField(
//                       readOnly: false,
//                       initialValue: 'App Subscription',
//                       style: const TextStyle(
//                           fontSize: 14, fontWeight: FontWeight.bold),
//                       decoration: const InputDecoration(
//                           isDense: true,
//                           labelText: 'Title',
//                           border: OutlineInputBorder(),
//                           contentPadding: EdgeInsets.all(12)),
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                             child: TextFormField(
//                           readOnly: true,
//                           initialValue: '12',
//                           style: TextStyle(
//                               fontSize: 14, fontWeight: FontWeight.bold),
//                           decoration: const InputDecoration(
//                               isDense: true,
//                               icon: Icon(Icons.attach_money),
//                               contentPadding: const EdgeInsets.all(8)),
//                         )),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Expanded(
//                             child: TextFormField(
//                           readOnly: true,
//                           initialValue: 'Business',
//                           style: TextStyle(
//                               fontSize: 14, fontWeight: FontWeight.bold),
//                           decoration: const InputDecoration(
//                               isDense: true,
//                               icon: Icon(Icons.work),
//                               contentPadding: const EdgeInsets.all(8)),
//                         )),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         OutlineButton.icon(
//                           borderSide: BorderSide(width: 1, color: Colors.black),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                           onPressed: () {},
//                           icon: Icon(Icons.today),
//                           label: Text(DateFormat('MMMM dd, yyyy')
//                               .format(DateTime.now())),
//                         ),
//                         RaisedButton.icon(
//                           color: primaryColor,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(4)),
//                           onPressed: this.done,
//                           icon: const Icon(
//                             Icons.add,
//                             color: Colors.white,
//                           ),
//                           label: Text(
//                             'ADD',
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ))
//             ],
//           )),
//     );
//   }
// }

// TextFormField(
//                           readOnly: false,
//                           initialValue: 'Business',
//                           style: TextStyle(
//                               fontSize: 14, fontWeight: FontWeight.bold),
//                           decoration: const InputDecoration(
//                               isDense: true,
//                               icon: Icon(Icons.work),
//                               contentPadding: const EdgeInsets.all(8)),
//                         )

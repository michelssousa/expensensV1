import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Newtransaction extends StatefulWidget {
  final double opacity;
  final Function done;

  Newtransaction(this.opacity, this.done);

  @override
  _NewtransactionState createState() => _NewtransactionState();
}

class _NewtransactionState extends State<Newtransaction> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Container(
      child: Center(
        child: Text('data'),
      ),
    );
  }
}

// Transaction(
//       date: '03/06/2020',
//       genericInfo: GenericInfo.educacao,
//       descriptionInfo: 'Compra sapatos',
//       value: 20.30,
//       userName: 'Michel')

// onPressed: () {
//   showDatePicker(
//     context: context,
//     initialDate: _dateTime == null ? DateTime.now() : _dateTime,
//     firstDate: DateTime(2001),
//     lastDate: DateTime(2021)
//   ).then((date) {
//     setState(() {
//       _dateTime = date;
//     });
//   });

// child: Expanded(
//     child: AnimatedContainer(
//   duration: Duration(
//     seconds: 1,
//   ),
//   curve: Curves.fastOutSlowIn,
//   width: double.infinity,
//   padding: const EdgeInsets.all(40),
//   color: Colors.white.withOpacity(widget.opacity),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.end,
//     children: [
//       TextFormField(
//         readOnly: false,
//         initialValue: 'App Subscription',
//         style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//         decoration: const InputDecoration(
//             isDense: true,
//             labelText: 'Title',
//             border: OutlineInputBorder(),
//             contentPadding: EdgeInsets.all(12)),
//       ),
//       Row(
//         children: [
//           Expanded(
//               child: TextFormField(
//             readOnly: true,
//             initialValue: '12',
//             style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//             decoration: const InputDecoration(
//                 isDense: true,
//                 icon: Icon(Icons.attach_money),
//                 contentPadding: const EdgeInsets.all(8)),
//           )),
//           SizedBox(
//             width: 20,
//           ),
//           Expanded(
//               child: TextFormField(
//             readOnly: true,
//             initialValue: 'Business',
//             style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//             decoration: const InputDecoration(
//                 isDense: true,
//                 icon: Icon(Icons.work),
//                 contentPadding: const EdgeInsets.all(8)),
//           )),
//         ],
//       ),
//       SizedBox(
//         height: 10,
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           OutlineButton.icon(
//             borderSide: BorderSide(width: 1, color: Colors.black),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(4),
//             ),
//             onPressed: () => _selectDate(context),
//             icon: Icon(Icons.today),
//             label: Text(DateFormat('MMMM dd, yyyy').format(selectedDate)),
//           ),
//           RaisedButton.icon(
//             color: primaryColor,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(4)),
//             onPressed: this.widget.done,
//             icon: const Icon(
//               Icons.add,
//               color: Colors.white,
//             ),
//             label: Text(
//               'ADD',
//               style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold),
//             ),
//           )
//         ],
//       )
//     ],
//   ),
// )),

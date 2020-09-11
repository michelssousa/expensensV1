import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/domain/providers/presentation/providerPresentation.dart';
import 'package:grouped_list/grouped_list.dart';

// List _elements = [
//   {'name': 'John', 'group': 'Team A'},
//   {'name': 'Will', 'group': 'Team B'},
//   {'name': 'Beth', 'group': 'Team A'},
//   {'name': 'Miranda', 'group': 'Team B'},
//   {'name': 'Mike', 'group': 'Team C'},
//   {'name': 'Danny', 'group': 'Team C'},
// ];

var mod = ProviderPresentation().getModTransaction();
var repo = mod.modTransaction();
List _elements = repo.betweenMonthListJson(1, 2);

class Listtransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GroupedListView<dynamic, dynamic>(
      elements: _elements,
      groupBy: (element) => element['date'],
      order: GroupedListOrder.ASC,
      useStickyGroupSeparators: true,
      groupSeparatorBuilder: (value) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          value.toString(),
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
      itemBuilder: (c, element) {
        return Card(
          elevation: 1.0,
          margin: new EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Container(
            child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                leading: Text(
                  element['date'].toString().substring(1, 5),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ), //Icon(Icons.expand_less, size: 30),
                title: Text(element['genericInfo'].toString()),
                subtitle: Text(element['descriptionInfo']),
                trailing: Text('R\$ ' + element['value'].toString(),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight
                            .bold))), //Text(element['date'].toString())),
          ),
        );
      },
    );
  }
}

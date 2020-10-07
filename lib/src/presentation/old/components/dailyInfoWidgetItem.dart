import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/domain/providers/presentation/providerPresentation.dart';

class Dailyinfowidgetitem extends StatelessWidget {
  IconData icon;
  dynamic title, subtitle, trailing;
  var _appColor = ProviderPresentation().getModConfig().getColor();
  Dailyinfowidgetitem({IconData icon, title, subtitle, trailing});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(
          color: Colors.white24,
        ),
        ListTile(
          leading: Icon(
            icon,
            size: 26,
            color: Colors.grey[700],
          ),
          title: Text(
            title,
            style: _appColor.cDescStyle,
          ),
          subtitle: Text(
            subtitle,
            style: _appColor.cSubStyle,
          ),
          trailing: Text(
            trailing,
            style: _appColor.cTrallingStyle,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterExpenses/src/domain/providers/presentation/providerPresentation.dart';
import 'package:flutterExpenses/src/domain/providers/variables/globalVariables.dart';

class Homescreen extends StatefulWidget {
  Homescreen({Key key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var _appColor = ProviderPresentation().getModConfig().getColor();
  var mod = ProviderPresentation().getModTransaction();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _appColor.blackbag,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 60.0,
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _gradienteInfoContainer(
                      context,
                      _appColor.startBlue,
                      _appColor.midBlue,
                      _appColor.endBlue,
                      "Expenses",
                      "Ksh 34,00"),
                  _gradienteInfoContainer(
                      context,
                      _appColor.startBlue,
                      _appColor.midBlue,
                      _appColor.endBlue,
                      "Balance",
                      "Ksh 34,00"),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            _dailyInfoWidget(context, "Ultimas Transações"),
          ],
        ),
      ),
    );
  }

  List<Widget> _dailyInfoWidgetItens(context, List itens) {
    var commentWidgets = List<Widget>();

    for (var comment in itens) {
      IconData ic;

      switch (comment['genericInfo']) {
        case 'Alimentaçāo':
          {
            ic = Icons.local_dining;
          }
          break;
        case 'Transporte (combustível)':
          {
            ic = Icons.local_gas_station;
          }
          break;
        case 'Transporte':
          {
            ic = Icons.drive_eta;
          }
          break;
        case 'Educação':
          {
            ic = Icons.library_books;
          }
          break;
        case 'Vestuário':
          {
            ic = Icons.add_shopping_cart;
          }
          break;
        case 'Seviços':
          {
            ic = Icons.shopping_basket;
          }
          break;
        case 'Lazer':
          {
            ic = Icons.child_care;
          }
          break;
        case 'Entradas':
          {
            ic = Icons.monetization_on;
          }
          break;
        case 'Diversos':
          {
            ic = Icons.account_balance_wallet;
          }
          break;
        default:
          {
            ic = Icons.shopping_cart;
          }
      }

      var subTitle = comment['date'].toString().substring(1, 5) +
          '-' +
          comment['descriptionInfo'];
      var value = "R\$ " + comment['value'].toString().replaceAll(".", ",");

      commentWidgets.add(_dailyInfoWidgetItem(
          context, ic, comment['genericInfo'], subTitle, value));
    }

    return commentWidgets;
  }

  _dailyInfoWidgetItem(context, IconData icon, title, subtitle, trailing) {
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

  _dailyInfoWidget(context, day) {
    var repo = mod.modTransaction();
    var keys = repo.betweenMonthListJson(1, 2);

    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(left: 18.0, right: 18.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: _appColor.semiBlackbag,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            day,
            style: _appColor.cTitleStyle,
          ),
          SizedBox(
            height: 4.0,
          ),

          //aqui
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _dailyInfoWidgetItens(context, keys),
          )
        ],
      ),
    );
  }

  _gradienteInfoContainer(
      context, startColor, midColor, endColor, subTitle, title) {
    return Container(
      margin: EdgeInsets.all(14),
      padding: EdgeInsets.all(16),
      height: 170,
      width: MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
          color: _appColor.semiBlackbag,
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: <Color>[startColor, midColor, endColor],
              stops: [0.0, 0.5, 1.0],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(60),
              ),
              child: Icon(
                Icons.terrain,
                color: startColor,
                size: 34,
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(title, style: _appColor.cardSubTitleStyle),
            SizedBox(
              height: 5,
            ),
            Text(subTitle, style: _appColor.cardTitleStyle),
          ],
        ),
      ),
    );
  }
}
// }

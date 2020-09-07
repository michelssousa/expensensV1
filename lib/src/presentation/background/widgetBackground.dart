import 'package:flutter/widgets.dart';
import 'package:flutterExpenses/src/domain/providers/presentation/config/color/appColor.dart';
import 'package:flutterExpenses/src/domain/providers/presentation/config/config.dart';
import 'package:flutter/material.dart';

class WidgetBackground extends StatelessWidget {
  final AppColor _appColor = Config().getColor();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
            top: -64,
            right: -128,
            child: Container(
              width: 256.0,
              height: 256.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9000),
                color: _appColor.colorTertiary,
              ),
            )),
        Positioned(
            top: -164,
            right: -8.0,
            child: Container(
              width: 256.0,
              height: 256.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9000),
                backgroundBlendMode: BlendMode.hardLight,
                color: Colors.redAccent.withOpacity(0.8),
              ),
            ))
      ],
    );
  }
}

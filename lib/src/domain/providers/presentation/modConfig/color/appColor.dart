import 'dart:ui';

import 'package:flutter/material.dart';

class Theme {
  final String fontFamily = "Poppins";
  final startBlue = Color.fromRGBO(47, 202, 171, 1);
  final midBlue = Color.fromRGBO(63, 162, 203, 1);
  final endBlue = Color.fromRGBO(85, 134, 230, 1);

  final startYellow = Color.fromRGBO(246, 182, 112, 1);
  final midYellow = Color.fromRGBO(242, 146, 105, 1);
  final endYellow = Color.fromRGBO(238, 119, 100, 1);

  final startPink = Color.fromRGBO(250, 47, 141, 1);
  final midPink = Color.fromRGBO(250, 54, 172, 1);
  final endPink = Color.fromRGBO(249, 57, 192, 1);

  final startPurple = Color.fromRGBO(179, 99, 209, 1);
  final midPurple = Color.fromRGBO(146, 83, 200, 1);
  final endPurple = Color.fromRGBO(118, 69, 193, 1);

  final blackbag = Color.fromRGBO(17, 17, 17, 1);
  final semiBlackbag = Color.fromRGBO(32, 32, 32, 1);

  final cardSubTitleStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  final cardTitleStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w800,
    fontSize: 22,
  );
  final cTitleStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
  final cDescStyle = TextStyle(
    color: Colors.white70,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );
  final cSubStyle = TextStyle(
    color: Colors.white60,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );
  final cTrallingStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w800,
    fontSize: 14,
  );
}

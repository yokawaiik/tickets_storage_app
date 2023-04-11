import 'package:flutter/material.dart';

import '../global/utils/utils.dart';

class AppTheme {
  ThemeData get theme => ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.purple,
      );
}

class ColorConstants {
  static Color deleteColor = hexToColor('#ff7291');
}

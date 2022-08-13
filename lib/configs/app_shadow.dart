import 'package:flutter/material.dart';

import 'app_color.dart';

class AppShadow {
  static final boxShadow = [
    const BoxShadow(
      color: AppColors.shadow,
      blurRadius: 3,
      offset: Offset(0, 0),
    ),
  ];
}

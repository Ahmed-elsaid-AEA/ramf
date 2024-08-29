import 'package:flutter/material.dart';

import 'colors_manager.dart';
import 'fonts_manager.dart';

class TextStyleManager {
  static const TextStyle bodyLarge = TextStyle(
    fontWeight: FontWeight.w700,
    color: ColorsManager.kWhiteColor,
    fontSize: FontsSize.f16,
  );
  static const TextStyle displayLarge = TextStyle(
    fontWeight: FontWeight.w700,
    color: ColorsManager.kLightBlack,
    fontSize: FontsSize.f16,
  );
  static const TextStyle displayMedium = TextStyle(
    fontWeight: FontWeight.w500,
    color: ColorsManager.kDarkGrey,
    fontSize: FontsSize.f14,
  );
  static TextStyle bodyMedium = TextStyle(
    fontWeight: FontWeight.w600,
    color: ColorsManager.kLightBlack.withOpacity(.91),
    fontSize: FontsSize.f14,
  );
  static TextStyle bodySmall = TextStyle(
    fontSize: FontsSize.f14,
    fontWeight: FontWeight.w900,
    color: ColorsManager.kLightBlack.withOpacity(.91),
  );
}

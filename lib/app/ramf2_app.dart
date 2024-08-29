import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramf2_app/core/resources/const_values.dart';
import 'package:ramf2_app/core/resources/routes_manager.dart';
import 'package:ramf2_app/core/translation/translation_app.dart';

class RAMF2App extends StatelessWidget {
  const RAMF2App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: TranslationApp(),
      locale: const Locale(ConstValues.kLangEn),
      initialRoute: RoutesName.splashScreenRoute,
      getPages: RoutesManager.getPages,
    );
  }
}

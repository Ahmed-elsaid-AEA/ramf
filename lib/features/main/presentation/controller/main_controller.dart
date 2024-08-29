import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramf2_app/core/classes/navigator_progresses.dart';
import 'package:ramf2_app/core/translation/trans_keys.dart';
import 'package:ramf2_app/features/home/presentation/controller/main_home_controller_imp.dart';
import 'package:ramf2_app/features/home/presentation/screens/home_screen.dart';
import 'package:ramf2_app/features/main/data/models/main_screen_model.dart';
import 'package:ramf2_app/features/settings/presentation/screens/setting_screen.dart';

class MainController extends GetxController implements MainControllerImp {
  int activeIndexScreen = 0;

  @override
  void changeActiveScreen(int index) {
    activeIndexScreen = index;
    update();
  }

  @override
  // TODO: implement listMainScreen
  List<MainScreenModel> get listMainScreen => [
        MainScreenModel(
            icon: Icons.home,
            label: TranslationKey.kHome.tr,
            screenWidget: const HomeScreen()),
        MainScreenModel(
            icon: Icons.settings_outlined,
            label: TranslationKey.kSettings.tr,
            screenWidget: const SettingsScreen()),
      ];
}

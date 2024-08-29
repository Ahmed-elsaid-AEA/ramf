import 'package:get/get.dart';
import 'package:ramf2_app/features/find_STB/presentation/screens/find_stb_screen.dart';
import 'package:ramf2_app/features/home/presentation/screens/home_screen.dart';
import 'package:ramf2_app/features/main/presentation/screens/main_screen.dart';
import 'package:ramf2_app/features/settings/presentation/screens/setting_screen.dart';
import 'package:ramf2_app/features/signal_check_sat_stb/presentation/screens/signal_check_sat_stb_screen.dart';
import 'package:ramf2_app/features/splash/presentation/screens/splash_screen.dart';

class RoutesManager {
  static final List<GetPage> getPages = [
    GetPage(
      name: RoutesName.splashScreenRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RoutesName.homeScreenRoute,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: RoutesName.mainScreenRoute,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: RoutesName.settingsScreenRoute,
      page: () => const SettingsScreen(),
    ),
    GetPage(
      name: RoutesName.signalCheckScreenRoute,
      page: () => const SignalCheckSatSTBScreen(),
    ),
    GetPage(
      name: RoutesName.findSTBScreenRoute,
      page: () => const FindSTBScreen(),
    ),
  ];
}

class RoutesName {
  static const String splashScreenRoute = "/splashScreenRoute";
  static const String signalCheckScreenRoute = "/signalCheckScreenRoute";
  static const String homeScreenRoute = "/homeRoute";
  static const String mainScreenRoute = "/mainScreenRoute";
  static const String settingsScreenRoute = "/settingsScreenRoute";
  static const String findSTBScreenRoute = "/findSTBScreenRoute";
}

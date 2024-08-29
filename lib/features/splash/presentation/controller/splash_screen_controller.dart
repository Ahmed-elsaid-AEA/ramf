import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ramf2_app/core/resources/durations_manager.dart';
import 'package:ramf2_app/core/resources/routes_manager.dart';
import 'package:ramf2_app/core/services/my_services.dart';
import 'package:ramf2_app/features/home/presentation/screens/home_screen.dart';
import 'package:ramf2_app/features/main/presentation/screens/main_screen.dart';
import 'package:ramf2_app/features/splash/presentation/controller/splash_screen_controller_imp.dart';

class SplashController extends GetxController implements SplashControllerImp {
  double width = 0;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startAnimation();
  }

  @override
  void goToHome() {
    myServices.navigatorProgresses.goToNewScreenAndReplacementUsingScreenName(
        screenName: const MainScreen(), transition: Transition.leftToRight);
  }

  @override
  void startAnimation() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      width = 500;
      update();
    });
    Future.delayed(
      const Duration(seconds: SecondsValues.s2),
      () {
        goToHome();
      },
    );
  }
}

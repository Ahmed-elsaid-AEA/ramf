import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramf2_app/core/resources/assets_manager.dart';
import 'package:ramf2_app/core/resources/durations_manager.dart';
import 'package:ramf2_app/features/splash/presentation/controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController controller = Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
            duration: const Duration(seconds: SecondsValues.s1),
            width: controller.width,
            child: Image.asset(AssetsManager.logoImage)),
      ),
    );
  }
}

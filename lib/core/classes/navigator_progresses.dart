import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ramf2_app/core/resources/durations_manager.dart';

class NavigatorProgresses implements NavigatorProgressesImp {
  @override
  backToLastScreen({Object? argument}) {
    Get.back();
  }

  @override
  goToNewScreenUsingRouteName({required String routeName, Object? argument}) {
    Get.toNamed(
      routeName,
      arguments: argument,
    );
  }

  @override
  goToNewScreenAndDeleteAllScreensUsingRouteName(
      {required String routeName, Object? argument}) {
    Get.offAllNamed(routeName, arguments: argument);
  }

  @override
  goToNewScreenAndReplacementUsingRouteName(
      {required String routeName, Object? argument}) {
    Get.offNamed(
      routeName,
      arguments: argument,
    );
  }

  @override
  void goToNewScreenAndReplacementUsingScreenName({
    required Widget screenName,
    Object? argument,
    Transition transition = Transition.leftToRightWithFade,
    Duration duration = const Duration(milliseconds: MillisecondsValues.ms1500),
  }) {
    Get.off(
      () => screenName,
      transition: transition,
      arguments: argument,
      duration: duration,
    );
  }

  @override
  void goToNewScreenUsingScreenName(
      {required Widget screenName,
      Object? argument,
      Transition transition = Transition.leftToRightWithFade,
      Duration duration =
          const Duration(milliseconds: MillisecondsValues.ms1500)}) {
    Get.to(
      () => screenName,
      transition: transition,
      arguments: argument,
      duration: duration,
    );
  }

  @override
  void goToNewScreenAndDeleteAllScreensUsingScreenName(
      {required Widget screenName,
      Object? argument,
      Transition transition = Transition.leftToRightWithFade,
      Duration duration =
          const Duration(milliseconds: MillisecondsValues.ms1500)}) {
    Get.offAll(
      () => screenName,
      transition: transition,
      arguments: argument,
      duration: duration,
    ); // TODO: implement goToNewScreenAndDeleteAllScreensUsingScreenName
  }
}

abstract class NavigatorProgressesImp {
  void goToNewScreenUsingRouteName(
      {required String routeName, Object? argument});

  void goToNewScreenAndReplacementUsingRouteName(
      {required String routeName, Object? argument});

  void goToNewScreenAndReplacementUsingScreenName({
    required Widget screenName,
    Object? argument,
    Transition transition = Transition.leftToRightWithFade,
    Duration duration = const Duration(milliseconds: MillisecondsValues.ms1500),
  });

  void goToNewScreenUsingScreenName({
    required Widget screenName,
    Object? argument,
    Transition transition = Transition.leftToRightWithFade,
    Duration duration = const Duration(milliseconds: MillisecondsValues.ms1500),
  });

  void goToNewScreenAndDeleteAllScreensUsingScreenName({
    required Widget screenName,
    Object? argument,
    Transition transition = Transition.leftToRightWithFade,
    Duration duration = const Duration(milliseconds: MillisecondsValues.ms1500),
  });

  void goToNewScreenAndDeleteAllScreensUsingRouteName(
      {required String routeName, Object? argument});

  void backToLastScreen({Object? argument});
}

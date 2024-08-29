import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramf2_app/app/ramf_2.dart';
import 'package:ramf2_app/core/api/api_links.dart';
import 'package:ramf2_app/core/classes/navigator_progresses.dart';
import 'package:ramf2_app/core/error/StatusRequest.dart';
import 'package:ramf2_app/core/resources/const_values.dart';
import 'package:ramf2_app/core/resources/fonts_manager.dart';
import 'package:ramf2_app/core/resources/routes_manager.dart';
import 'package:ramf2_app/core/services/my_services.dart';
import 'package:ramf2_app/core/translation/trans_keys.dart';
import 'package:ramf2_app/core/translation/translation_app.dart';
import 'package:ramf2_app/features/home/data/models/stb_data_model.dart';
import 'package:ramf2_app/features/main/presentation/controller/main_controller_imp.dart';
import 'package:http/http.dart' as http;

class MainHomeController extends GetxController
    implements MainHomeControllerImp {
  late TextEditingController stbIPTextEditingController;
  final MyServices _myServices = Get.find();
  double fontTextFieldLabel = FontsSize.f14;
  late STBDataModel stbData;
  StatusRequest connectSTBStatusRequest = StatusRequest.none;

  MainHomeController() {
    onInitState();
  }

  @override
  void goToSignalCheckScreenSatSTB() {
    _myServices.navigatorProgresses.goToNewScreenUsingRouteName(
        routeName: RoutesName.signalCheckScreenRoute,
        argument: {
          ConstValues.kIp: stbIPTextEditingController.text,
        });
  }

  @override
  void goToSignalCheckScreenTerSTB() {
    // TODO: implement goToSignalCheckScreenTerSTB
  }

  @override
  void onDispose() {
    stbIPTextEditingController.dispose();
  }

  @override
  void onInitState() {
    stbIPTextEditingController = TextEditingController();
  }

  @override
  void navigateToScreen({required int indexScreen}) {
    switch (indexScreen) {
      case 0:
        goToSignalCheckScreenSatSTB();
      default:
    }
  }

  @override
  void onTapTextFieldIP() {
    fontTextFieldLabel = FontsSize.f20;
    update();
  }

  bool isFirstRun = true;

  @override
  void onSubmittedTextFieldIP() {
    if (stbIPTextEditingController.text.isEmpty) {
      fontTextFieldLabel = FontsSize.f14;
      update();
    }
  }

  // Future<Stream<List<int>>> fetchAsStream(String url) async {
  //   final response = await http.Client().get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     return response.bodyBytes.asStream();
  //   } else {
  //     throw Exception('Failed to get data from API');
  //   }
  // }
  late Timer t;
  String secondTick = "0";

  startTimer() async {
    bool a = await makeConnectionToBox();
    if (a != true) {
      secondTick = "0";

      connectSTBStatusRequest = StatusRequest.loading;
      update();
      t = Timer.periodic(const Duration(seconds: 1), (timer) async {
        print(timer.tick);
        secondTick = timer.tick.toString();
        update();
        bool done = await makeConnectionToBox();
        if (done == true) {
          t.cancel();
          connectSTBStatusRequest = StatusRequest.sucess;
          secondTick =
              "${TranslationKey.kConnected.tr} ($elapsedTime" + "ms" + ")";
          update();
        }
      });
    }
  }

  int elapsedTime = 0;

  @override
  Future<bool> makeConnectionToBox() async {
    try {
      connectSTBStatusRequest = StatusRequest.loading;
      update();
      final startTime = DateTime.now();
      var response = await http
          .get(
            Uri.parse(
              ApiLinks.stbVersionEndPoint,
            ),
          )
          .timeout(const Duration(seconds: 1));

      final endTime = DateTime.now(); // Record end time
      elapsedTime = endTime.difference(startTime).inMilliseconds;
      if (jsonDecode(response.body)['ret_code'] == "NO_ERR") {
        stbData = STBDataModel.fromJson(jsonDecode(response.body));
        print(stbData);
        connectSTBStatusRequest = StatusRequest.sucess;
        secondTick =
            "${TranslationKey.kConnected.tr} ($elapsedTime" + "ms" + ")";
        update();
        return true;
      }
      update();
      return false;
    } catch (e) {
      // print(e.toString());
      //
      // connectSTBStatusRequest = StatusRequest.failure;
      update();
      return false;
    }
  }

  @override
  void goToFindSTBScreen() {
    _myServices.navigatorProgresses
        .goToNewScreenUsingRouteName(routeName: RoutesName.findSTBScreenRoute);
  }
}

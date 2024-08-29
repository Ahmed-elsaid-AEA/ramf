import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramf2_app/core/translation/trans_keys.dart';
import 'package:ramf2_app/features/find_STB/presentation/controller/find_stb_controller.dart';

class ProgressTimePart extends GetView<FindSTBControllerScreen> {
  const ProgressTimePart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FindSTBControllerScreen>(
      builder: (controller) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          controller.progress == 0
              ? const CupertinoActivityIndicator()
              : Text(
                  "Found (${controller.listRamfDevice.length})  RAMF of (${controller.listDeviceDetailsModel.length}) devices ${TranslationKey.kElapsed.tr} ${controller.progress.toString().substring(0, 5)}s",
                  style: TextStyle(color: Colors.blue[900],fontWeight: FontWeight.bold),
                ),
        ],
      ),
    );
  }
}

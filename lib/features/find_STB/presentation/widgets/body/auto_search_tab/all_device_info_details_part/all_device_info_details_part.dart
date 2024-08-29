import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramf2_app/core/resources/assets_manager.dart';
import 'package:ramf2_app/core/resources/colors_manager.dart';
import 'package:ramf2_app/core/resources/const_values.dart';
import 'package:ramf2_app/core/resources/height_values.dart';
import 'package:ramf2_app/core/resources/padding_manager.dart';
import 'package:ramf2_app/core/resources/width_values.dart';
import 'package:ramf2_app/core/translation/trans_keys.dart';
import 'package:ramf2_app/features/find_STB/data/models/device_details_model.dart';
import 'package:ramf2_app/features/find_STB/presentation/controller/find_stb_controller.dart';
import 'package:ramf2_app/features/find_STB/presentation/widgets/body/auto_search_tab/all_device_info_details_part/custom_list_device_info_auto_search_name.dart';

class AllDeviceInfoDetailsPart extends GetView<FindSTBControllerScreen> {
  const AllDeviceInfoDetailsPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FindSTBControllerScreen>(builder: (controller) {
      return controller.startProgress == true
          ? const CupertinoActivityIndicator()
          : CustomListDeviceInfoAutoSearchName(
              listDetails: controller.selectedRamf == true
                  ? controller.listRamfDevice
                  : controller.listDeviceDetailsModel);
    });
  }
}


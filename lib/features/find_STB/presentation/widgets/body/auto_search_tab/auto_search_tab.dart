import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramf2_app/core/resources/height_values.dart';
import 'package:ramf2_app/core/resources/padding_manager.dart';
import 'package:ramf2_app/core/resources/width_values.dart';
import 'package:ramf2_app/features/find_STB/presentation/controller/find_stb_controller.dart';
import 'package:ramf2_app/features/find_STB/presentation/widgets/body/auto_search_tab/all_device_info_details_part/all_device_info_details_part.dart';
import 'package:ramf2_app/features/find_STB/presentation/widgets/body/auto_search_tab/device_ip_details_part/device_ip_details_part.dart';
import 'package:ramf2_app/features/find_STB/presentation/widgets/body/auto_search_tab/progress_timer_part/progress_timer_part.dart';

class AutoSearchTab extends GetView<FindSTBControllerScreen> {
  const AutoSearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: PaddingValues.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: HeightValues.h10),
          DeviceIpDetailsPart(),
          ProgressTimePart(),
          SizedBox(height: HeightValues.h20),
          AllDeviceInfoDetailsPart(),
        ],
      ),
    );
  }
}

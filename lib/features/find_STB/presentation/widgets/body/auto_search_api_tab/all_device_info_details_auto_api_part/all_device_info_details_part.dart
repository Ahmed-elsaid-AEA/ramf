import 'package:flutter/cupertino.dart';
 import 'package:get/get.dart';
 import 'package:ramf2_app/features/find_STB/presentation/controller/find_stb_controller.dart';
import 'package:ramf2_app/features/find_STB/presentation/widgets/body/auto_search_api_tab/all_device_info_details_auto_api_part/custom_list_device_info_auto__api.dart';

class AllDeviceInfoDetailsAutoApi extends GetView<FindSTBControllerScreen> {
  const AllDeviceInfoDetailsAutoApi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FindSTBControllerScreen>(builder: (controller) {
      return controller.startProgress == true
          ? const CupertinoActivityIndicator()
          : CustomListDeviceInfoAutoAPi(
          listRamfDevice: controller.listRamfDevice);
    });
  }
}


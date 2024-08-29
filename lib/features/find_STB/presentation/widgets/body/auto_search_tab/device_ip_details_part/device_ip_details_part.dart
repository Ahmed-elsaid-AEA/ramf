import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramf2_app/core/resources/const_values.dart';
import 'package:ramf2_app/core/widgets/custom_text_form_field.dart';
import 'package:ramf2_app/features/find_STB/presentation/controller/find_stb_controller.dart';

class DeviceIpDetailsPart extends GetView<FindSTBControllerScreen> {
  const DeviceIpDetailsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FindSTBControllerScreen>(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${ConstValues.kPhoneIp} ${controller.ipModelData.wifiIp}"),
              Text(
                  "${ConstValues.kSubnetMask} ${controller.ipModelData.wifiSubMask}"),
              Text(
                  "${ConstValues.kGateway} ${controller.ipModelData.wifiGatewayIP}"),
              Text(
                  "${ConstValues.kBroadcast} ${controller.ipModelData.lastIp}"),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      controller.searchIp();
                    },
                    child: Text('Search')),
                CheckboxListTile(
                  value: controller.selectedRamf,
                  onChanged: (value) {
                    controller.onTapAtRamfSelected();
                  },
                  title: Text('RAMF'),
                  controlAffinity: ListTileControlAffinity.leading,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

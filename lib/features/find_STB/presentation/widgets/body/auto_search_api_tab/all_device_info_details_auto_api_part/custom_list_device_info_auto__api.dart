import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:ramf2_app/core/resources/assets_manager.dart';
import 'package:ramf2_app/core/resources/colors_manager.dart';
import 'package:ramf2_app/core/resources/const_values.dart';
import 'package:ramf2_app/core/resources/height_values.dart';
import 'package:ramf2_app/core/resources/padding_manager.dart';
import 'package:ramf2_app/core/resources/width_values.dart';
 import 'package:ramf2_app/features/find_STB/data/models/device_details_model.dart';



class CustomListDeviceInfoAutoAPi extends StatelessWidget {
  const CustomListDeviceInfoAutoAPi({super.key, required this.listRamfDevice});

  final List<DeviceDetailsModel> listRamfDevice;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: listRamfDevice.isEmpty
          ? const Center(
          child: CupertinoActivityIndicator(
            radius: 50,
          ))
          : ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemBuilder: (context, index) => ListTile(
            trailing: const Icon(Icons.connect_without_contact),
            tileColor: ColorsManager.kPrimaryColor,
            contentPadding: const EdgeInsets.symmetric(
                horizontal: PaddingValues.p10),
            onTap: () {
              print("object");
            },
            title: Text(listRamfDevice[index].stpName==null?"":listRamfDevice[index].stpName!),
            leading: const Image(
              image: AssetImage(
                AssetsManager.ramfLogo,
              ),
              width: WidthValues.w40,
            ),
            subtitle: Text(
                "${listRamfDevice[index].internetAddress.address}\n"
                    "ttl: ${listRamfDevice[index].pingData.response!.ttl} ,"
                    " time: ${listRamfDevice[index].pingData.response!.time!.inMilliseconds.toString()} ms"),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: HeightValues.h4,
          ),
          itemCount: listRamfDevice.length),
    );
  }
}

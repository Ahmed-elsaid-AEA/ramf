import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ramf2_app/core/resources/assets_manager.dart';
import 'package:ramf2_app/core/resources/colors_manager.dart';
import 'package:ramf2_app/core/resources/const_values.dart';
import 'package:ramf2_app/core/resources/height_values.dart';
import 'package:ramf2_app/core/resources/padding_manager.dart';
import 'package:ramf2_app/core/resources/width_values.dart';
import 'package:ramf2_app/features/find_STB/data/models/device_details_model.dart';

class CustomListDeviceInfoAutoSearchName extends StatelessWidget {
  const CustomListDeviceInfoAutoSearchName(
      {super.key, required this.listDetails});

  final List<DeviceDetailsModel> listDetails;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: listDetails.isEmpty
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
                    title: FutureBuilder(
                      future: listDetails[index].hostName,
                      builder: (context, snapshot) =>
                          Text(snapshot.data.toString()),
                    ),
                    leading: FutureBuilder(
                        future: listDetails[index].hostName,
                        builder: (context, snapshot) {
                          return snapshot.data == ConstValues.kLwip
                              ? const Image(
                                  image: AssetImage(
                                    AssetsManager.ramfLogo,
                                  ),
                                  width: WidthValues.w40,
                                )
                              : const SizedBox(
                                  width: WidthValues.w40,
                                );
                        }),
                    subtitle: Text(
                        "${listDetails[index].internetAddress.address}\nttl: ${listDetails[index].pingData.response!.ttl} , time: ${listDetails[index].pingData.response!.time!.inMilliseconds.toString()} ms"),
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: HeightValues.h4,
                  ),
              itemCount: listDetails.length),
    );
  }
}

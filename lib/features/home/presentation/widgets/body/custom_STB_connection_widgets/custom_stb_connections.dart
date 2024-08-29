import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:ramf2_app/core/api/api_links.dart';
import 'package:ramf2_app/core/error/StatusRequest.dart';
import 'package:ramf2_app/core/resources/colors_manager.dart';
import 'package:ramf2_app/core/resources/const_values.dart';
import 'package:ramf2_app/core/resources/fonts_manager.dart';
import 'package:ramf2_app/core/resources/padding_manager.dart';
import 'package:ramf2_app/core/resources/width_values.dart';
import 'package:ramf2_app/core/translation/trans_keys.dart';
import 'package:ramf2_app/core/widgets/custom_text_form_field.dart';
import 'package:ramf2_app/features/home/presentation/controller/main_home_controller.dart';

class CustomSTBConnection extends GetView<MainHomeController> {
  const CustomSTBConnection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: PaddingValues.p16,
        left: PaddingValues.p10,
        right: PaddingValues.p10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  onFieldSubmitted: (value) {
                    controller.onSubmittedTextFieldIP();
                  },
                  onTap: () {
                    controller.onTapTextFieldIP();
                  },
                  textFontSize: FontsSize.f18,
                  hintText: TranslationKey.kWriteSTBIP.tr,
                  label: GetBuilder<MainHomeController>(builder: (logic) {
                    return Text(ConstValues.kIp,
                        style: TextStyle(
                            color: ColorsManager.kBlueColor,
                            fontSize: controller.fontTextFieldLabel,
                            fontWeight: FontWeight.bold));
                  }),
                  controller: controller.stbIPTextEditingController,
                  validator: (value) {
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: WidthValues.w5),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(PaddingValues.p8)),
                onPressed: () async {
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(
                  //     margin: EdgeInsets.only(
                  //         // left: 100.0,
                  //         // right: 10.0,
                  //         bottom: 800),
                  //     behavior: SnackBarBehavior.floating,
                  //     elevation: 0,
                  //     backgroundColor: Colors.transparent,
                  //     content: Center(
                  //       child: CircularProgressIndicator(),
                  //     ),
                  //   ),
                  // );
                  // showDialog(context: context, builder: (context) =>AlertDialog(content: CupertinoActivityIndicator(),),);
                  controller.startTimer();
                  // DateTime startTime = DateTime.now();
                  // final response= await get(Uri.parse(ApiLinks.stbVersionEndPoint));
                  // print(  response.body);
                  // print(response);
                  // final endTime = DateTime.now(); // Record end time
                  // int elapsedTime =
                  //     endTime.difference(startTime).inMilliseconds;
                  // print(elapsedTime);
                },
                icon: GetBuilder<MainHomeController>(
                    builder: (controller) => SizedBox(
                          width: 20,
                          height: 20,
                          child: controller.connectSTBStatusRequest ==
                                  StatusRequest.loading
                              ? const CircularProgressIndicator()
                              : controller.connectSTBStatusRequest ==
                                      StatusRequest.sucess
                                  ? const Icon(
                                      Icons.signal_cellular_alt,
                                      color: Colors.green,
                                    )
                                  : const Icon(
                                      Icons
                                          .signal_cellular_connected_no_internet_4_bar,
                                    ),
                        )),
                label: Text(TranslationKey.kConnect.tr),
              ),
              const SizedBox(width: WidthValues.w5),
              ElevatedButton.icon(
                  onPressed: () {
                    controller.goToFindSTBScreen();
                  },
                  icon: const Icon(Icons.find_replace),
                  label: Text(TranslationKey.kFind.tr)),
            ],
          ),
          GetBuilder<MainHomeController>(builder: (logic) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  controller.secondTick,
                  style: const TextStyle(
                    color: ColorsManager.kGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (controller.connectSTBStatusRequest == StatusRequest.sucess)
                  Text(
                      "${controller.stbData.stbName} ${controller.stbData.version.stb.split(' ').getRange(0, 2)}  APi : ${controller.stbData.version.webApi}")
              ],
            );
          })
        ],
      ),
    );
  }
}

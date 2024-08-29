import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramf2_app/core/resources/colors_manager.dart';
import 'package:ramf2_app/core/resources/const_values.dart';
import 'package:ramf2_app/core/resources/fonts_manager.dart';
import 'package:ramf2_app/core/resources/padding_manager.dart';
import 'package:ramf2_app/core/translation/trans_keys.dart';
import 'package:ramf2_app/core/widgets/custom_text_form_field.dart';
import 'package:ramf2_app/features/home/presentation/widgets/body/custom_grid_view_item_widgets/custom_item_home_screen.dart';
import 'package:ramf2_app/models/home/home_icons_model.dart';

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({
    super.key,
    required this.listHomeIcons,
  });

  final List<HomeIconsModel> listHomeIcons;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: PaddingValues.p16,
              left: PaddingValues.p10,
              right: PaddingValues.p10,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  textFontSize: FontsSize.f18,
                  hintText: TranslationKey.kWriteSTBIP.tr,
                  label: const Text(ConstValues.kIp,
                      style: TextStyle(
                          fontSize: FontsSize.f20,
                          fontWeight: FontWeight.bold)),
                  controller: TextEditingController(),
                  validator: (value) {
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                Text(
                  TranslationKey.kConnected.tr,
                  style: const TextStyle(
                    color: ColorsManager.kGreen,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(PaddingValues.p10),
            itemCount: listHomeIcons.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 3 / 2,
                crossAxisCount: 3,
                mainAxisSpacing: PaddingValues.p20,
                crossAxisSpacing: PaddingValues.p20),
            itemBuilder: (context, index) =>
                CustomItemHomeScreen(
                  homeIconsModel: listHomeIcons[0],
                ),
          ),
        ],
      ),
    );
  }
}

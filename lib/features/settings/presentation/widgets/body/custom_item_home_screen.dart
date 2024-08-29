import 'package:flutter/material.dart';
import 'package:ramf2_app/core/resources/border_radius_manager.dart';
import 'package:ramf2_app/core/resources/colors_manager.dart';
import 'package:ramf2_app/core/resources/fonts_manager.dart';
import 'package:ramf2_app/core/resources/height_values.dart';
import 'package:ramf2_app/models/home/home_icons_model.dart';

class CustomItemHomeScreen extends StatelessWidget {
  const CustomItemHomeScreen({
    super.key,
    required this.homeIconsModel,
  });

  final HomeIconsModel homeIconsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius:
              const BorderRadius.all(Radius.circular(BorderRadiusValue.br10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: HeightValues.h10),
          Icon(homeIconsModel.icon),
          const SizedBox(height: HeightValues.h4),
          Text(homeIconsModel.text,
              style: const TextStyle(
                  color: ColorsManager.kPrimaryColor,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: HeightValues.h3),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: ColorsManager.kLight2Black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(BorderRadiusValue.br10),
                  bottomRight: Radius.circular(BorderRadiusValue.br10),
                ),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                homeIconsModel.desc,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: FontsSize.f14,
                    color: ColorsManager.kYellowColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

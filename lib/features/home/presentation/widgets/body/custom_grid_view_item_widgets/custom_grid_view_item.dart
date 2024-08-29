import 'package:flutter/material.dart';
import 'package:ramf2_app/core/resources/padding_manager.dart';
import 'package:ramf2_app/features/home/presentation/controller/main_home_controller.dart';
import 'package:ramf2_app/features/home/presentation/widgets/body/custom_grid_view_item_widgets/custom_item_home_screen.dart';
import 'package:ramf2_app/models/home/home_icons_model.dart';

class CustomGridViewItem extends StatelessWidget {
  const CustomGridViewItem({
    super.key,
    required this.listHomeIcons,
    required this.controller,
  });

  final List<HomeIconsModel> listHomeIcons;
  final MainHomeController controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(PaddingValues.p10),
      itemCount: listHomeIcons.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio:5 /4,
          crossAxisCount: 3,
          mainAxisSpacing: PaddingValues.p20,
          crossAxisSpacing: PaddingValues.p20),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const Ramf2(),
          //     ));

          controller.navigateToScreen(indexScreen: index);
        },
        child: CustomItemHomeScreen(
          homeIconsModel: listHomeIcons[index],
        ),
      ),
    );
  }
}

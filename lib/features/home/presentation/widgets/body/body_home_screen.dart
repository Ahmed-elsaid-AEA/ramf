import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramf2_app/features/home/presentation/controller/main_home_controller.dart';
import 'package:ramf2_app/features/home/presentation/widgets/body/custom_STB_connection_widgets/custom_stb_connections.dart';
import 'package:ramf2_app/features/home/presentation/widgets/body/custom_grid_view_item_widgets/custom_grid_view_item.dart';
import 'package:ramf2_app/models/home/home_icons_model.dart';

class BodyHomeScreen extends GetView<MainHomeController> {
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
          const CustomSTBConnection(),
          CustomGridViewItem(
              listHomeIcons: listHomeIcons, controller: controller),
        ],
      ),
    );
  }
}

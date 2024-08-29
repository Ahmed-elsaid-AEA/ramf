import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramf2_app/core/resources/border_radius_manager.dart';
import 'package:ramf2_app/core/resources/colors_manager.dart';
import 'package:ramf2_app/core/resources/const_values.dart';
import 'package:ramf2_app/core/resources/padding_manager.dart';
import 'package:ramf2_app/core/translation/trans_keys.dart';
import 'package:ramf2_app/core/widgets/custom_text_form_field.dart';
import 'package:ramf2_app/core/widgets/search_delegate_widget.dart';
import 'package:ramf2_app/features/home/presentation/controller/main_home_controller.dart';
import 'package:ramf2_app/features/home/presentation/widgets/body/custom_grid_view_item_widgets/custom_item_home_screen.dart';

import '../widgets/body/body_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MainHomeController homeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController = Get.put(MainHomeController());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyHomeScreen(
        listHomeIcons: ConstsHome.listItemHomeModel,
      ),
    );
  }
}

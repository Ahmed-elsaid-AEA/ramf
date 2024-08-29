import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramf2_app/core/resources/border_radius_manager.dart';
import 'package:ramf2_app/core/resources/colors_manager.dart';
import 'package:ramf2_app/core/resources/const_values.dart';
import 'package:ramf2_app/core/resources/fonts_manager.dart';
import 'package:ramf2_app/core/resources/padding_manager.dart';
import 'package:ramf2_app/core/translation/trans_keys.dart';
import 'package:ramf2_app/core/widgets/custom_text_form_field.dart';
import 'package:ramf2_app/core/widgets/search_delegate_widget.dart';
import 'package:ramf2_app/features/home/presentation/controller/main_home_controller.dart';
import 'package:ramf2_app/features/home/presentation/widgets/body/custom_grid_view_item_widgets/custom_item_home_screen.dart';
import 'package:ramf2_app/features/main/data/models/main_screen_model.dart';

import '../controller/main_controller.dart';
import '../widgets/body/body_home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainController controller = Get.put(MainController());
    return Scaffold(
      bottomNavigationBar: GetBuilder<MainController>(
        assignId: true,
        builder: (controller) {
          return BottomNavigationBar(
            selectedItemColor: ColorsManager.kPrimaryColor,
            unselectedItemColor: ColorsManager.kGrey1.withOpacity(.5),
            currentIndex: controller.activeIndexScreen,
            onTap: (int value) async{

              controller.changeActiveScreen(value);
            },
            items: [
              for (MainScreenModel mainScreenModel in controller.listMainScreen)
                BottomNavigationBarItem(
                    icon: Icon(mainScreenModel.icon),
                    label: mainScreenModel.label),
            ],
          );
        },
      ),
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: ColorsManager.kPrimaryColor,
        title: Text(
          TranslationKey.kRamfApp.tr,
          style: const TextStyle(
              color: ColorsManager.kWhiteColor,
              fontWeight: FontWeight.bold,
              fontSize: FontsSize.f24),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                try {
                  final q = await showSearch(
                    context: context,
                    delegate: SearchDelegateWidget(),
                  );
                  // CustomSearchDelegate();
                } catch (e) {
                  print(e.toString());
                }
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: GetBuilder<MainController>(
        builder: (MainController controller) {
          return controller
              .listMainScreen[controller.activeIndexScreen].screenWidget;
        },
      ),
    );
  }
}

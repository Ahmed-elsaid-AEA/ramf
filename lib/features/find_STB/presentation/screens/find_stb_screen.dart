import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramf2_app/core/resources/border_radius_manager.dart';
import 'package:ramf2_app/core/resources/colors_manager.dart';
import 'package:ramf2_app/core/resources/const_values.dart';
import 'package:ramf2_app/core/resources/fonts_manager.dart';
import 'package:ramf2_app/core/resources/height_values.dart';
import 'package:ramf2_app/core/resources/padding_manager.dart';
import 'package:ramf2_app/core/resources/width_values.dart';
import 'package:ramf2_app/core/translation/trans_keys.dart';
import 'package:ramf2_app/core/widgets/custom_text_form_field.dart';
import 'package:ramf2_app/features/find_STB/presentation/controller/find_stb_controller.dart';
import 'package:ramf2_app/features/find_STB/presentation/widgets/body/auto_search_api_tab/auto_search_api_tab.dart';
import 'package:ramf2_app/features/find_STB/presentation/widgets/body/auto_search_tab/auto_search_tab.dart';

class FindSTBScreen extends StatefulWidget {
  const FindSTBScreen({super.key});

  @override
  State<FindSTBScreen> createState() => _FindSTBScreenState();
}

class _FindSTBScreenState extends State<FindSTBScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  late FindSTBControllerScreen _stbControllerScreen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    _stbControllerScreen = Get.put(FindSTBControllerScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find STB"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            onTap: (value) {
              _stbControllerScreen.onTapAtTabBar(index: value);
            },
            // indicator: BoxDecoration(
            //     color: Colors.red,
            //     borderRadius: BorderRadius.circular(BorderRadiusValue.br10)),
            labelStyle: const TextStyle(
                color: ColorsManager.kPrimaryColor,
                fontSize: FontsSize.f16,
                fontWeight: FontWeight.bold),
            labelPadding: const EdgeInsets.all(PaddingValues.p10),
            unselectedLabelColor: Colors.blue,
            padding: const EdgeInsets.all(PaddingValues.p10),
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            tabs: [
              const Text('Auto (API)'),
              const Row(
                children: [
                  Text('Auto (Name)'),
                  SizedBox(
                    width: WidthValues.w5,
                  ),
                  Icon(Icons.search)
                ],
              ),
              Text(TranslationKey.kManual.tr),
              Text(TranslationKey.kAdvanced.tr),
            ],
            controller: tabController,
          ),
          Expanded(
            child: TabBarView(controller: tabController, children: [
              const AutoSearchApiTab(),
              const AutoSearchTab(),
              Container(
                color: Colors.blue,
                width: 150,
                height: 150,
              ),
              Container(
                color: Colors.blue,
                width: 150,
                height: 150,
              )
            ]),
          ),
        ],
      ),
    );
  }
}

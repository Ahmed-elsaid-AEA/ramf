import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramf2_app/core/translation/trans_keys.dart';
import 'package:ramf2_app/models/home/home_icons_model.dart';

class ConstValues {
  static const String kLang = 'lang';
  static const String kLangAr = 'ar';
  static const String kLangEn = 'en';
  static const String kLangFr = 'fr';
  static const String kRamf = 'Ramf';
  static const String kLwip = 'lwip';

  static const int k200 = 200;
  static const int k201 = 201;
  static const int k299 = 299;
  static const int k400 = 400;
  static const int k499 = 499;
  static const int k422 = 422;
  static const String kIp = 'IP';
  static const String kPhoneIp = 'Phone Ip';
  static const String kSubnetMask = 'Subnet Mask';
  static const String kGateway = 'Gateway';
  static const String kBroadcast = 'Broadcast';
}

class ConstsHome {
  static List<HomeIconsModel> listItemHomeModel = [
    HomeIconsModel(
      desc: TranslationKey.kSatSTB.tr,
      icon: Icons.satellite_alt,
      text: TranslationKey.kSignalCheck.tr,
    ),
  ];
}

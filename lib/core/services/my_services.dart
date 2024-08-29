import 'package:get/get.dart';
 import 'package:ramf2_app/core/classes/navigator_progresses.dart';

class MyServices extends GetxService {
  // late SharedPreferences sharedPreferences;
  late NavigatorProgresses navigatorProgresses;

  // late CacheManager cacheManager;

  // late CachedNetworkImage cachedNetworkImage;
  Future<MyServices> init() async {

    // try {
    //   await Firebase.initializeApp();
    // } catch (e) {
    //   debugPrint(e.toString());
    // }
    navigatorProgresses = NavigatorProgresses();
    // cacheManager = CacheManager(
    //   Config("customCacheKey",
    //       maxNrOfCacheObjects: 100, stalePeriod: const Duration(days: 1)),
    // );

    // sharedPreferences = await SharedPreferences.getInstance();

    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}

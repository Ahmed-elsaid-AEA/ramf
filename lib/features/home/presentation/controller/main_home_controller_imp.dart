import 'package:ramf2_app/features/main/data/models/main_screen_model.dart';

abstract class MainControllerImp {
  List<MainScreenModel> get listMainScreen;

  void changeActiveScreen(int index);
}

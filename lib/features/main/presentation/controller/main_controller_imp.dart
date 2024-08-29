
abstract class MainHomeControllerImp {
  void goToSignalCheckScreenSatSTB();
  void goToFindSTBScreen();

  void goToSignalCheckScreenTerSTB(/*أرضي الديجتال*/);

  Future<bool> makeConnectionToBox();

  void onInitState();

  void onDispose();

  void onTapTextFieldIP();

  void onSubmittedTextFieldIP();

  void navigateToScreen({required int indexScreen});
}

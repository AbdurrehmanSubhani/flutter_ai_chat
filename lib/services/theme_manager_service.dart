import 'package:stacked/stacked.dart';

class ThemeManagerService with ListenableServiceMixin {
  bool isDarkMode = true;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}

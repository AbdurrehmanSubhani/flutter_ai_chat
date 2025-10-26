import 'package:flutter_ai_chat/services/theme_manager_service.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_ai_chat/app/app.locator.dart';

class MainViewModel extends ReactiveViewModel {
  final _themeManagerService = locator<ThemeManagerService>();

  bool get isDarkMode => _themeManagerService.isDarkMode;

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _themeManagerService,
      ];
}

import 'package:flutter_ai_chat/services/ai_chat_service.dart';
import 'package:flutter_ai_chat/services/user_manager_service.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_ai_chat/app/app.locator.dart';
import 'package:flutter_ai_chat/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userManagerService = locator<UserManagerService>();
  final _aiChatService = locator<AiChatService>();

  Future runStartupLogic() async {
    _userManagerService.initUser(
      _userManagerService.getTestUser(),
    );

    _aiChatService.initService();
    _navigationService.replaceWithChatView();
  }
}

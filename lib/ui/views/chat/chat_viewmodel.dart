import 'package:flutter_ai_chat/app/app.locator.dart';
import 'package:flutter_ai_chat/services/chat_manager_service.dart';
import 'package:flutter_ai_chat/services/theme_manager_service.dart';
import 'package:flutter_ai_chat/services/user_manager_service.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:stacked/stacked.dart';

class ChatViewModel extends ReactiveViewModel {
  final _userService = locator<UserManagerService>();
  final _chatManagerService = locator<ChatManagerService>();
  final _themeManagerService = locator<ThemeManagerService>();

  User get user => _userService.getTestUser();
  String get userId => user.id;
  ChatController get chatController => _chatManagerService.chatController;
  bool get isDarkMode => _themeManagerService.isDarkMode;

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _themeManagerService,
      ];

  Future handleMessageSend(String text) async {
    try {
      await _chatManagerService.createAiChatCompletionMessage(text);
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  Future<User?> resolveUser(UserID id) async {
    return _userService.getUserById(id);
  }
}

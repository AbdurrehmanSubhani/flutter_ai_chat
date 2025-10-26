import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:uuid/uuid.dart';

class ChatManagerService {
  final InMemoryChatController chatController = InMemoryChatController();

  void addChatTextMessage(
    String text,
    String authorId,
  ) {
    try {
      chatController.insertMessage(
        TextMessage(
          id: const Uuid().v4(),
          text: text,
          authorId: authorId,
        ),
      );
    } catch (e) {
      print('Error adding chat text message: $e');
      rethrow;
    }
  }
}

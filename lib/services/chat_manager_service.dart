import 'package:flutter_ai_chat/app/app.locator.dart';
import 'package:flutter_ai_chat/services/ai_chat_service.dart';
import 'package:flutter_ai_chat/services/user_manager_service.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:openai_dart/openai_dart.dart';
import 'package:uuid/uuid.dart';

class ChatManagerService {
  final _userManagerService = locator<UserManagerService>();
  final InMemoryChatController chatController = InMemoryChatController();
  final _aiChatService = locator<AiChatService>();

  List<ChatCompletionMessage> formatMessageList() {
    final chatMessages = chatController.messages;
    return chatMessages.map((Message message) {
      final messageAuthorId = message.authorId;
      final messageRole = messageAuthorId == _userManagerService.user.id
          ? ChatCompletionMessageRole.user
          : ChatCompletionMessageRole.assistant;

      switch (messageRole) {
        case ChatCompletionMessageRole.user:
          {
            if (message is TextMessage) {
              return ChatCompletionMessage.user(
                content: ChatCompletionUserMessageContent.string(message.text),
              );
            }

            return const ChatCompletionMessage.user(
              content: ChatCompletionUserMessageContent.string(''),
            );
          }
        case ChatCompletionMessageRole.assistant:
          {
            if (message is TextMessage) {
              return ChatCompletionMessage.user(
                content: ChatCompletionUserMessageContent.string(message.text),
              );
            }

            return const ChatCompletionMessage.assistant();
          }
        default:
          throw Exception('Unknown message role');
      }
    }).toList();
  }

  Future<void> createAiChatCompletionMessage(String userMessage) async {
    try {
      addChatTextMessage(
        userMessage,
        _userManagerService.getTestUser().id,
      );

      List<ChatCompletionMessage> messages = formatMessageList();

      final aiMessage = await _aiChatService.createAiChatCompletionMessage(
        userMessage,
        messages,
      );

      final Message message = TextMessage(
        id: const Uuid().v4(),
        text: aiMessage,
        authorId: _userManagerService.getAIUser().id,
      );

      chatController.insertMessage(message);
    } catch (e) {
      print('Error creating AI chat completion message: $e');
      rethrow;
    }
  }

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

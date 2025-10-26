import 'package:flutter_ai_chat/constants.dart';
import 'package:openai_dart/openai_dart.dart';

class AiChatService {
  late OpenAIClient _client;

  void initService() {
    try {
      _client = OpenAIClient(apiKey: openaiApiKey);
    } catch (error) {
      rethrow;
    }
  }

  Future<String> createAiChatCompletionMessage(
    String userMessage,
    List<ChatCompletionMessage> messages,
  ) async {
    try {
      final res = await _client.createChatCompletion(
        request: CreateChatCompletionRequest(
          model: const ChatCompletionModel.modelId(openaiChatModel),
          messages: [
            const ChatCompletionMessage.developer(
              role: ChatCompletionMessageRole.developer,
              content: ChatCompletionDeveloperMessageContent.text(
                  'You are a helpful AI assistant.'),
            ),
            ...messages,
          ],
        ),
      );

      if (res.choices.isEmpty) {
        throw Exception('No choices returned from OpenAI API');
      }

      if (res.choices.first.message.content == 'null') {
        throw Exception('No content returned from OpenAI API');
      }

      return res.choices.first.message.content!;
    } catch (error) {
      rethrow;
    }
  }
}

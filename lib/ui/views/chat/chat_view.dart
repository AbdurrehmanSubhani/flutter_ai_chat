import 'package:flutter/material.dart';
import 'package:flutter_ai_chat/ui/widgets/common/chat_app_bar/chat_app_bar.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:stacked/stacked.dart';

import 'chat_viewmodel.dart';

class ChatView extends StackedView<ChatViewModel> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChatViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const ChatAppBar(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Chat(
        chatController: viewModel.chatController,
        currentUserId: viewModel.userId,
        onMessageSend: viewModel.handleMessageSend,
        resolveUser: viewModel.resolveUser,
        theme: viewModel.isDarkMode ? ChatTheme.dark() : ChatTheme.light(),
      ),
    );
  }

  @override
  ChatViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatViewModel();
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'chat_app_bar_model.dart';

class ChatAppBar extends StackedView<ChatAppBarModel>
    implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Widget builder(
    BuildContext context,
    ChatAppBarModel viewModel,
    Widget? child,
  ) {
    return AppBar(title: const Text('Chat'), actions: [
      IconButton(
        icon: Icon(viewModel.isDarkMode ? Icons.light_mode : Icons.dark_mode),
        onPressed: viewModel.toggleTheme,
      ),
    ]);
  }

  @override
  ChatAppBarModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatAppBarModel();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

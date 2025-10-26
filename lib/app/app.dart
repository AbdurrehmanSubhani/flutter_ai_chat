import 'package:flutter_ai_chat/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:flutter_ai_chat/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:flutter_ai_chat/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_ai_chat/ui/views/chat/chat_view.dart';
import 'package:flutter_ai_chat/services/ai_chat_service.dart';
import 'package:flutter_ai_chat/services/user_manager_service.dart';
import 'package:flutter_ai_chat/services/chat_manager_service.dart';
import 'package:flutter_ai_chat/services/theme_manager_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: ChatView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ThemeManagerService),
    LazySingleton(classType: AiChatService),
    LazySingleton(classType: UserManagerService),
    LazySingleton(classType: ChatManagerService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}

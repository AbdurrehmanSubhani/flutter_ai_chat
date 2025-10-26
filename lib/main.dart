import 'package:flutter/material.dart';
import 'package:flutter_ai_chat/app/app.bottomsheets.dart';
import 'package:flutter_ai_chat/app/app.dialogs.dart';
import 'package:flutter_ai_chat/app/app.locator.dart';
import 'package:flutter_ai_chat/app/app.router.dart';
import 'package:flutter_ai_chat/main_viewmodel.dart';
import 'package:flutter_ai_chat/ui/views/startup/startup_viewmodel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

Future setupServices() async {
  try {
    // all the stacked services
    await setupLocator();
    setupDialogUi();
    setupBottomSheetUi();

    await dotenv.load(fileName: '.env');
  } catch (error) {
    rethrow;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServices();
  runApp(const MainApp());
}

class MainApp extends StackedView<MainViewModel> {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MainViewModel viewModel,
    Widget? child,
  ) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [StackedService.routeObserver],
      theme: viewModel.isDarkMode ? ThemeData.dark() : ThemeData.light(),
    );
  }

  @override
  MainViewModel viewModelBuilder(BuildContext context) => MainViewModel();
}
